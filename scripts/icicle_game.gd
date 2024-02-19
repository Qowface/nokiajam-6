extends Node2D


@onready var icicles = $Icicles
@onready var start_timer = $StartTimer
@onready var icicle_timer = $IcicleTimer


func _ready():
	start_timer.start()


func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()


func drop_random_icicle():
	var icicle = icicles.get_children().pick_random()
	if not icicle.falling:
		icicle.fall()


func _on_start_timer_timeout():
	icicle_timer.start()


func _on_icicle_timer_timeout():
	drop_random_icicle()
