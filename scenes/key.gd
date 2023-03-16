extends Node2D

func _ready():
	self.visible = false
	$"/root/Signals".connect("placed_key", func (position: Vector2i, cell_quadrant_size: int) -> void:
		print("key at ", position)
		self.position = position * cell_quadrant_size
		self.visible = true
	)

func _on_key_collider_body_entered(body):
	self.visible = false
	$"/root/Signals".key_touched.emit()
	pass # Replace with function body.
