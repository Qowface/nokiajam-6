extends Control


func _ready():
	$ScoreLabel.visible = false
	$NewHighScoreLabel.visible = false
	$RestartLabel.visible = false
	
	AudioPlayer.play_sfx("gameover")
	
	$ScoreLabel.text = "SCORE: " + str(Stats.score)
	var new_high_score = Stats.check_high_score()
	
	await get_tree().create_timer(1.0).timeout
	$ScoreLabel.visible = true
	
	if new_high_score:
		await get_tree().create_timer(1.0).timeout
		$NewHighScoreLabel.visible = true
		AudioPlayer.play_sfx("highscore")
	
	await get_tree().create_timer(1.0).timeout
	$RestartLabel.visible = true
	$AnimationPlayer.play("blink")


func _process(delta):
	if Input.is_action_just_pressed("jump"):
		AudioPlayer.play_sfx("start")
		SceneManager.change_scene("start")
