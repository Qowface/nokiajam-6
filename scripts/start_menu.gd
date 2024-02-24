extends Control


func _process(delta):
	if Input.is_action_just_pressed("jump"):
		SceneManager.change_scene("game")
