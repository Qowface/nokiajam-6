extends CharacterBody2D


const SPEED = 60
const JUMP_VELOCITY = -150

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var screen_size


func _ready():
	screen_size = get_viewport_rect().size


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	position.x = clamp(position.x, 0, screen_size.x - 8)
