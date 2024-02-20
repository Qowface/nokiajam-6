extends Area2D


signal hit_player
signal scored

@export var fall_speed = 10

var falling = false

@onready var animation = $AnimatedSprite2D


func _ready():
	reset()


func _process(delta):
	if falling:
		global_position.y += fall_speed * delta
		if global_position.y > 48:
			scored.emit()
			reset()


func fall():
	animation.play("wiggle")
	await animation.animation_finished
	falling = true


func reset():
	falling = false
	global_position.y = 0
	animation.play("grow")


func _on_body_entered(body):
	if body is Player:
		hit_player.emit()
		reset()
