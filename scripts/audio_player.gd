extends Node


var sfx_list = {
	"hit": preload("res://assets/sfx/hit3.wav")
}

@onready var sfx: AudioStreamPlayer = $SfxPlayer


func play_sfx(sfx_name: String):
	sfx.stop()
	sfx.stream = sfx_list[sfx_name]
	sfx.play()
