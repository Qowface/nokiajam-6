extends Node2D


var lives = 3
var icicle_speed = 10
var score_increment = 10
var playing: bool = false

var coin_scene = preload("res://scenes/coin.tscn")

@onready var player = $Player
@onready var icicles = $Icicles
@onready var start_timer = $Timers/StartTimer
@onready var icicle_timer = $Timers/IcicleTimer
@onready var coin_timer = $Timers/CoinTimer
@onready var ui = $UI


func _ready():
	AudioPlayer.play_sfx("getready")
	
	Stats.reset()
	start_timer.start()
	
	for icicle in get_tree().get_nodes_in_group("icicles"):
		icicle.hit_player.connect(_on_icicle_hit_player)
		icicle.scored.connect(_on_icicle_scored)
	
	ui.set_score_label(Stats.score)
	ui.update_hearts(lives)
	ui.display_banner("GET READY")


func _process(delta):
	if Input.is_action_just_pressed("pause") and playing:
		get_tree().paused = !get_tree().paused
		ui.toggle_paused(get_tree().paused)


func drop_random_icicle():
	var icicle = icicles.get_children().pick_random()
	if not icicle.falling:
		icicle.fall()


func _on_start_timer_timeout():
	playing = true
	icicle_timer.start()


func _on_icicle_timer_timeout():
	drop_random_icicle()


func _on_icicle_hit_player():
	AudioPlayer.play_sfx("hit")
	player.blink()
	lives -= 1
	ui.update_hearts(lives)
	if lives <= 0:
		game_over()


func _on_icicle_scored():
	Stats.score += score_increment
	ui.set_score_label(Stats.score)
	speed_up_icicles()


func game_over():
	playing = false
	player.die()
	ui.display_banner("YOU DIED")
	get_tree().paused = true
	await get_tree().create_timer(4.0).timeout
	get_tree().paused = false
	SceneManager.change_scene("end")


func speed_up_icicles():
	icicle_speed += 1
	score_increment = floor(icicle_speed / 10) * 10
	for icicle in get_tree().get_nodes_in_group("icicles"):
		icicle.fall_speed = icicle_speed


func spawn_coin():
	if get_tree().get_nodes_in_group("coins").size() > 0:
		return
	
	var coin_instance = coin_scene.instantiate()
	coin_instance.global_position = Vector2(randi_range(0, 77), 24)
	coin_instance.scored.connect(_on_coin_scored)
	add_child(coin_instance)


func _on_coin_timer_timeout():
	spawn_coin()
	coin_timer.wait_time = randf_range(5.0, 10.0)


func _on_coin_scored():
	AudioPlayer.play_sfx("coin")
	Stats.score += score_increment * 5
	ui.set_score_label(Stats.score)
