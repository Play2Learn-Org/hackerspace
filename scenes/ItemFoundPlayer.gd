extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$"/root/Signals".key_touched.connect(func () -> void:
		if !self.playing:
			self.play()
	)
