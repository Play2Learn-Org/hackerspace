extends ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	$CenterContainer/PanelContainer/MarginContainer/VBoxContainer/NextButton.pressed.connect(func () -> void:
		get_tree().paused = false
		get_tree().reload_current_scene
		$"/root/Signals".next_level.emit()
	)
	$CenterContainer/PanelContainer/MarginContainer/VBoxContainer/QuitButton.pressed.connect(get_tree().quit)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
