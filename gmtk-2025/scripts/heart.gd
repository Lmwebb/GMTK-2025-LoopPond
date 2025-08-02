extends Area2D

func _on_body_entered(body: Node2D) -> void:
	GlobalTimer.timer += 40
	queue_free()
