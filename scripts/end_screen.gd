extends Control


func _ready():
	$ScoreLabel.text = "SCORE: " + str(Stats.score)
	
	$ScoreLabel.visible = false
	$NewHighScoreLabel.visible = false
	$RestartLabel.visible = false
	
	await get_tree().create_timer(1.0).timeout
	$ScoreLabel.visible = true
	
	await get_tree().create_timer(1.0).timeout
	$RestartLabel.visible = true


func _process(delta):
	if Input.is_action_just_pressed("jump"):
		SceneManager.change_scene("start")
