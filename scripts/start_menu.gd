extends Control


func _ready():
	Stats.reset()
	$HighScoreLabel.text = "HIGH SCORE: " + str(Stats.high_score)


func _process(delta):
	if Input.is_action_just_pressed("jump"):
		SceneManager.change_scene("game")
