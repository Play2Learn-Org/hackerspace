extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	$"/root/Signals".connect("key_touched", func () -> void:
		self.text = str(int(self.text) + 1)
	)
	
	$"/root/Signals".connect("door_opened", func () -> void:
		self.text = str(int(self.text) - 1)
	)
