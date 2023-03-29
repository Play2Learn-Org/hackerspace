extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$"/root/Signals".exit_reached.connect(func () -> void:
		print("audio callback yeah")
		if !self.playing:
			print("playing yeah")
			self.play()
	)
