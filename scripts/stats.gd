extends Node


const CONFIG_PATH: String = "user://stats.cfg"

var score: int
var high_score: int

var _config: ConfigFile


func _ready():
	_config = ConfigFile.new()
	reset()


func reset():
	score = 0
	load_stats()


func check_high_score() -> bool:
	if score > high_score:
		high_score = score
		save_stats()
		return true
	else:
		return false


func load_stats():
	_config.load(CONFIG_PATH)
	high_score = _config.get_value("scoring", "high_score", 0)


func save_stats():
	_config.set_value("scoring", "high_score", high_score)
	_config.save(CONFIG_PATH)
