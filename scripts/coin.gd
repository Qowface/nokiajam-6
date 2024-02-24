extends Area2D


signal scored


var min_time = 5.0
var max_time = 10.0

@onready var despawn_timer = $DespawnTimer


func _ready():
	despawn_timer.wait_time = randf_range(min_time, max_time)
	despawn_timer.start()


func _on_body_entered(body):
	if body is Player:
		scored.emit()
		queue_free()


func _on_despawn_timer_timeout():
	queue_free()
