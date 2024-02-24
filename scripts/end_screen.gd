extends Control


func _ready():
	$ScoreLabel.visible = false
	$NewHighScoreLabel.visible = false
	$RestartLabel.visible = false
	
	$ScoreLabel.text = "SCORE: " + str(Stats.score)
	var new_high_score = Stats.check_high_score()
	
	await get_tree().create_timer(1.0).timeout
	$ScoreLabel.visible = true
	
	if new_high_score:
		await get_tree().create_timer(1.0).timeout
		$NewHighScoreLabel.visible = true
	
	await get_tree().create_timer(1.0).timeout
	$RestartLabel.visible = true
	$AnimationPlayer.play("blink")


func _process(delta):
	if Input.is_action_just_pressed("jump"):
		SceneManager.change_scene("start")
