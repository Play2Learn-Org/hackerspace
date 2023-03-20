extends Node2D

# to remember the reset position that is set by the game master at instantiating an exit at a map
@onready var old_pos : Vector2i = Vector2i(-1,-1)

func reset_position():
	self.position = self.old_pos
	self.visible = true

func _ready():
	self.visible = false
	$"/root/Signals".connect("placed_exit", func (target_pos: Vector2i, cell_quadrant_size: int) -> void:
		print("exit at ", target_pos)
		self.old_pos = self.position
		self.position = target_pos * cell_quadrant_size
		self.visible = true
	)
	$"/root/Signals".connect("next_level", func () -> void:
		self.reset_position()
	)
	

func _on_exit_area_body_entered(body):
	print("exit area entered by ", body)
	if "player" in body.get_groups():
		Signals.exit_reached.emit()
