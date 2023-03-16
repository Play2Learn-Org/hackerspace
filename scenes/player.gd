extends CharacterBody2D

# almost 1 by 1 from https://www.youtube.com/watch?v=Gp_98cuqXUY

const SPEED = 120.0

var input_direction: get = _get_input_direction
var sprite_direction = "Down": get = _get_sprite_direction

@onready var sprite = $AnimatedSprite2D
@onready var Signals = $"/root/Signals"

@export var keys = 0

func _ready():
	self.visible = false
	Signals.connect("placed_stairs", func (position: Vector2i, cell_quadrant_size: int) -> void:
		print("player at", position)
		self.position = position * cell_quadrant_size
		self.visible = true
	)
	Signals.connect("key_touched", func () -> void:
		print("I, the player, found a key, yay")
		keys += 1
	)
	Signals.connect("door_touched" , func () -> void:
		# TODO all of this sounds more like a global game logic rather than Player object specific?
		if keys > 0:
			keys -= 1
			print("I,the player, open the door")
			Signals.door_opened.emit()
		else:
			print("I, the player, need a key!")
	)

func _physics_process(_delta):
	velocity = input_direction * SPEED
	set_animation("idle" if velocity == Vector2.ZERO else "walk")
	move_and_slide()

func set_animation(animation):
	sprite.play(animation + sprite_direction)

func _get_input_direction():
	#var x = -int(Input.is_action_pressed("ui_left")) + int(Input.is_action_pressed("ui_right"))
	#var y = -int(Input.is_action_pressed("ui_up")) + int(Input.is_action_pressed("ui_down"))
	var input_vector = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)
	return input_vector.normalized()

func _get_sprite_direction():
	match input_direction:
		Vector2.UP:
			sprite_direction = "Up"
		Vector2.RIGHT:
			sprite_direction = "Right"
		Vector2.DOWN:
			sprite_direction = "Down"
		Vector2.LEFT:
			sprite_direction = "Left"
	return sprite_direction
