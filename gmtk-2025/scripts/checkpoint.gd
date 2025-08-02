extends Node

func _on_checkpoint_body_entered(body: Node2D) -> void:
	GlobalTimer.checkpoint = true

func _on_checkpoint_2_body_entered(body: Node2D) -> void:
	GlobalTimer.checkpoint2 = true
	GlobalTimer.checkpoint = false
	
func _on_checkpoint_3_body_entered(body: Node2D) -> void:
	GlobalTimer.checkpoint3 = true
	GlobalTimer.checkpoint2 = false
	GlobalTimer.checkpoint = false
