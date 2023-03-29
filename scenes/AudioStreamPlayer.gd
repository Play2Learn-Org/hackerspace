extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$"/root/Signals".start_walking.connect(func () -> void:
		if !self.playing:
			self.play()
	)
	$"/root/Signals".start_idling.connect(func () -> void:
		self.stop()
	)
