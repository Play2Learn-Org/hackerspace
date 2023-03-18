extends Node2D

@onready var Signals = $"/root/Signals"

func _ready():
	self.visible = false
	Signals.connect("placed_door", func (position: Vector2i, cell_quadrant_size: int) -> void:
		print("door at ", position)
		self.position = position * cell_quadrant_size
		self.visible = true
		$AnimatedSprite2D.animation = "closed"
	)
	Signals.connect("door_opened", func () -> void:
		$AnimatedSprite2D.animation = "open"
		$StaticBody2D/StaticCollisionShape.set_deferred("disabled", true)
	)


func _on_doorcollider_body_entered(body):
	if "player" in body.get_groups():
		Signals.door_touched.emit()
