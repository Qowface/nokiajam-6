extends CanvasLayer


@onready var score_label = $ScoreLabel
@onready var hearts = [$Hearts/Heart1, $Hearts/Heart2, $Hearts/Heart3]
@onready var banner_label = $Banner/BannerLabel
@onready var banner_animation = $BannerAnimationPlayer


func _ready():
	$Paused.visible = false


func set_score_label(score):
	score_label.text = str(score)


func update_hearts(lives):
	for i in range(3):
		if lives >= i + 1:
			hearts[i].visible = true
		else:
			hearts[i].visible = false


func display_banner(text):
	banner_label.text = text
	banner_animation.play("banner")


func toggle_paused(paused: bool):
	$Paused.visible = paused
