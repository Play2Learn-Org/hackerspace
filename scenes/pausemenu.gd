extends ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	$CenterContainer/PanelContainer/MarginContainer/VBoxContainer/ResumeButton.pressed.connect(func () -> void:
		$AnimationPlayer.play("unpause")
		get_tree().paused = false
	)
	$CenterContainer/PanelContainer/MarginContainer/VBoxContainer/QuitButton.pressed.connect(get_tree().quit)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
