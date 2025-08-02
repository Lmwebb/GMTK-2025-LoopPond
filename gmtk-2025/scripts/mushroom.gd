extends Area2D

@onready var player: CharacterBody2D = get_node("/root/Game/Player")

func _on_body_entered(body: Node2D) -> void:
	print("player detected")
	player._player_bounce(0, -500.0)
