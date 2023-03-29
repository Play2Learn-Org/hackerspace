extends ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	$CenterContainer/PanelContainer/MarginContainer/VBoxContainer/NextButton.pressed.connect(func () -> void:
		get_tree().paused = false
		$"/root/Signals".next_level.emit()
	)
	$CenterContainer/PanelContainer/MarginContainer/VBoxContainer/QuitButton.pressed.connect(get_tree().quit)
	
	$"/root/Signals".connect("exit_reached", func () -> void:
		print("levelendmenu exit_reached triggered")
		self.visible = true
		$AnimationPlayer.play("completed")
		get_tree().paused = true
	)
	$"/root/Signals".connect("next_level", func () -> void:
		print("levelendmenu exit_reached triggered")
		$AnimationPlayer.play("start")
		self.visible = false
		get_tree().paused = false
	)
