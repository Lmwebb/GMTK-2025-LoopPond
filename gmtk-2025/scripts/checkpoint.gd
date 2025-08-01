extends Area2D

func _on_body_entered(body: Node2D) -> void:
	GlobalTimer.checkpoint = true
	print("Checkpoint reached!")
