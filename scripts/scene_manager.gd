extends Node


@export var start_scene: PackedScene
@export var game_scene: PackedScene
@export var end_scene: PackedScene

var scene_list = null

@onready var root_node = get_node("/root/Main/Screen")


func _ready():
	scene_list = {
		"start": start_scene,
		"game": game_scene,
		"end": end_scene
	}


func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		change_scene("start")


func change_scene(scene_id: String):
	var new_scene = scene_list[scene_id]
	var scene_instance = new_scene.instantiate()
	for node in root_node.get_children():
		node.queue_free()
	root_node.add_child(scene_instance)
