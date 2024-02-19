extends Area2D


@export var fall_speed = 10

var falling = false

@onready var animation = $AnimatedSprite2D


func _ready():
	reset()


func _process(delta):
	if falling:
		global_position.y += fall_speed * delta
		if global_position.y > 48:
			reset()


func fall():
	animation.play("wiggle")
	await animation.animation_finished
	falling = true


func reset():
	falling = false
	global_position.y = 0
	animation.play("grow")
