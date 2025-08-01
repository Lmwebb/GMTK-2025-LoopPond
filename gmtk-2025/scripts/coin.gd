extends Area2D



func _on_body_entered(body: Node2D) -> void:
	GlobalTimer.timer += 20
	queue_free()
