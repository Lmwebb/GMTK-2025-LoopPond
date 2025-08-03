extends Area2D

@onready var player: CharacterBody2D = get_node("/root/Game/Player")
@onready var bounce: AudioStreamPlayer2D = $"../bounce"

func _on_body_entered(_body: Node2D) -> void:
	player._player_bounce(0, -500.0)
	bounce.play()
	
