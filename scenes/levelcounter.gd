extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	$"/root/Signals".connect("next_level", func () -> void:
		print("old level: ", self.text)
		self.text = str(int(self.text) + 1)
		print("new level: ", self.text)
	)
