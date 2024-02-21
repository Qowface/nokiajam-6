extends CanvasLayer


@onready var score_label = $ScoreLabel
@onready var hearts = [$Hearts/Heart1, $Hearts/Heart2, $Hearts/Heart3]


func set_score_label(score):
	score_label.text = str(score)


func update_hearts(lives):
	for i in range(3):
		if lives >= i + 1:
			hearts[i].visible = true
		else:
			hearts[i].visible = false
