extends CharacterBody2D

# almost 1 by 1 from https://www.youtube.com/watch?v=Gp_98cuqXUY

const SPEED = 120.0

var input_direction: get = _get_input_direction
var sprite_direction = "Down": get = _get_sprite_direction

@onready var sprite = $AnimatedSprite2D

func _physics_process(_delta):
	velocity = input_direction * SPEED
	move_and_slide()
	
	set_animation("idle" if velocity == Vector2.ZERO else "walk")

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
