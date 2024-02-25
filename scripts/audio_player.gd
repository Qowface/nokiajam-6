extends Node


var sfx_list = {
	"coin": preload("res://assets/sfx/blip5.wav"),
	"gameover": preload("res://assets/sfx/negative1.wav"),
	"getready": preload("res://assets/sfx/jingle1.wav"),
	"highscore": preload("res://assets/sfx/good3.wav"),
	"hit": preload("res://assets/sfx/hit3.wav"),
	"start": preload("res://assets/sfx/blip13.wav")
}

@onready var sfx: AudioStreamPlayer = $SfxPlayer


func play_sfx(sfx_name: String):
	sfx.stop()
	sfx.stream = sfx_list[sfx_name]
	sfx.play()
