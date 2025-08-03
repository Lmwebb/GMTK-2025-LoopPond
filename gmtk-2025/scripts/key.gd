extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	GlobalTimer.timer += 40
	animation_player.play("pickup")
