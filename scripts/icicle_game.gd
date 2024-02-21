extends Node2D


var lives = 3
var score = 0

@onready var player = $Player
@onready var icicles = $Icicles
@onready var start_timer = $Timers/StartTimer
@onready var icicle_timer = $Timers/IcicleTimer
@onready var ui = $UI


func _ready():
	start_timer.start()
	
	for icicle in get_tree().get_nodes_in_group("icicles"):
		icicle.hit_player.connect(_on_icicle_hit_player)
		icicle.scored.connect(_on_icicle_scored)
	
	print("Lives: " + str(lives))
	print("Score: " + str(score))
	ui.set_score_label(score)
	ui.update_hearts(lives)


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


func _on_icicle_hit_player():
	lives -= 1
	print("Lives: " + str(lives))
	ui.update_hearts(lives)
	if lives <= 0:
		game_over()


func _on_icicle_scored():
	score += 10
	print("Score: " + str(score))
	ui.set_score_label(score)


func game_over():
	player.die()
	print("Dead")
	get_tree().paused = true
	await get_tree().create_timer(2.0).timeout
	get_tree().paused = false
	get_tree().reload_current_scene()
