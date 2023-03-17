extends Control

@onready var animator: AnimationPlayer = $AnimationPlayer


func pause() -> void:
	print("pause func start")
	animator.play("pause")
	get_tree().paused = true
	print("pause func end")

func unpause() -> void:
	animator.play("unpause")
	get_tree().paused = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/ResumeButton.pressed.connect(unpause)
	$ColorRect/CenterContainer/PanelContainer/MarginContainer/VBoxContainer/QuitButton.pressed.connect(get_tree().quit)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
