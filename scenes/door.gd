extends Node2D

@onready var Signals = $"/root/Signals"

# to remember the reset position that is set by the game master at instantiating a door at a map
@onready var old_pos : Vector2i = Vector2i(-1,-1)

func reset_position():
	self.position = self.old_pos
	self.visible = true


func _ready():
	self.visible = false
	Signals.connect("placed_door", func (target_pos: Vector2i, cell_quadrant_size: int) -> void:
		print("door at ", target_pos)
		self.old_pos = self.position
		self.position = target_pos * cell_quadrant_size
		self.visible = true
		$AnimatedSprite2D.animation = "closed"
	)
	Signals.connect("door_opened", func () -> void:
		$AnimatedSprite2D.animation = "open"
		$StaticBody2D/StaticCollisionShape.set_deferred("disabled", true)
	)
	Signals.connect("next_level", func () -> void:
		self.reset_position()
	)


func _on_doorcollider_body_entered(body):
	if "player" in body.get_groups():
		Signals.door_touched.emit($AnimatedSprite2D.animation)
