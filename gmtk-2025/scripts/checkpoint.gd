extends Node

@onready var checkpointsound: AudioStreamPlayer2D = $Checkpointsound

func _on_checkpoint_body_entered(_body: Node2D) -> void:
	checkpointsound.play()
	GlobalTimer.checkpoint = true

func _on_checkpoint_2_body_entered(_body: Node2D) -> void:
	checkpointsound.play()
	GlobalTimer.checkpoint2 = true
	GlobalTimer.checkpoint = false
	
func _on_checkpoint_3_body_entered(_body: Node2D) -> void:
	checkpointsound.play()
	GlobalTimer.checkpoint3 = true
	GlobalTimer.checkpoint2 = false
	GlobalTimer.checkpoint = false
