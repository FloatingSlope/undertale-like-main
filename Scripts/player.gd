extends CharacterBody2D

@export var speed: float = 450.0              # Base speed (50% faster than 200)
@export var dash_duration: float = 10.0          # Dash lasts 3 seconds

var normal_speed: float = 450.0                # To store the original speed
var is_dashing: bool = false                   # Indicates if dash is active
var move_direction: Vector2 = Vector2.ZERO     # Movement vector set externally

func _ready() -> void:
	normal_speed = speed   # Store the normal speed at startup

# Called externally to update the movement direction.
func set_move_direction(direction: Vector2) -> void:
	move_direction = direction.normalized()

# Called externally to trigger the dash (jump) effect.
# When dash is triggered, the player's speed doubles for dash_duration seconds.
func dash(dash_direction: Vector2) -> void:
	if is_dashing:
		return
	is_dashing = true
	# Double the speed.
	speed = normal_speed * 2
	
	# Create a Timer node to end the dash after dash_duration seconds.
	var timer: Timer = Timer.new()
	timer.wait_time = dash_duration
	timer.one_shot = true
	add_child(timer)
	timer.start()
	timer.timeout.connect(Callable(self, "_on_dash_finished"))

# Callback when the Timer times out: reset speed and dash state.
func _on_dash_finished() -> void:
	speed = normal_speed
	is_dashing = false

# Update movement each physics frame.
func _physics_process(delta: float) -> void:
	velocity = move_direction * speed
	move_and_slide()
