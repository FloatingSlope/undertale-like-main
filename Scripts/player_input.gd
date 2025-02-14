extends Node2D

@onready var _player_character: CharacterBody2D = get_parent()

func _process(delta: float) -> void:
	var input_vector = Vector2.ZERO
	
	# Combine movement input from arrow keys and WASD.
	if Input.is_action_pressed("move_left") or Input.is_action_pressed("ui_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("move_right") or Input.is_action_pressed("ui_right"):
		input_vector.x += 1
	if Input.is_action_pressed("move_up") or Input.is_action_pressed("ui_up"):
		input_vector.y -= 1
	if Input.is_action_pressed("move_down") or Input.is_action_pressed("ui_down"):
		input_vector.y += 1
	
	# Update the character's movement direction every frame.
	_player_character.set_move_direction(input_vector)
	
	# When the jump key (now mapped to Tab via the "jump" action) is pressed:
	if Input.is_action_just_pressed("jump"):
		var dash_direction = input_vector
		# If no movement keys are held, default to dashing upward.
		if dash_direction == Vector2.ZERO:
			dash_direction = Vector2(0, -1)
		_player_character.dash(dash_direction)
