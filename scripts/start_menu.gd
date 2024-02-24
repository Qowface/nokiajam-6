extends Control


@onready var animation = $AnimationPlayer


func _ready():
	Stats.reset()
	$HighScoreLabel.text = "HIGH SCORE: " + str(Stats.high_score)


func _process(delta):
	if Input.is_action_just_pressed("jump"):
		AudioPlayer.play_sfx("start")
		animation.play("fast_blink")
		await animation.animation_finished
		SceneManager.change_scene("game")
