extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$"/root/Signals".door_opened.connect(func () -> void:
		if !self.playing:
			self.play()
	)
