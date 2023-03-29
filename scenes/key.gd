extends Node2D

# to remember the reset position that is set by the game master at instantiating a key at a map
@onready var old_pos : Vector2i = Vector2i(-1,-1)

func reset_position():
	self.position = self.old_pos
	self.visible = true


func _ready():
	self.visible = false
	$"/root/Signals".connect("placed_key", func (target_pos: Vector2i, cell_quadrant_size: int) -> void:
		print("key at ", target_pos)
		self.old_pos = self.position
		self.position = target_pos * cell_quadrant_size
		self.visible = true
	)
	$"/root/Signals".connect("next_level", func () -> void:
		print("key event callback next_level")
		self.reset_position()
	)

func _on_key_collider_body_entered(_body):
	self.visible = false
	$"/root/Signals".key_touched.emit()
	pass # Replace with function body.
