extends Area2D

@onready var game = get_tree().get_root().get_node("/root/Game")
@onready var projectile = load("res://scene/projectile.tscn")
@onready var timer: Timer = $Timer
@onready var player: CharacterBody2D = get_node("/root/Game/Player")


func _ready():
	shoot()
	
func shoot():
	var instance = projectile.instantiate()
	instance.dir = 90
	instance.spawnPos = global_position
	instance.spawnRot = rotation
	
	game.add_child.call_deferred(instance) 

func _on_timer_timeout() -> void:
	_ready()
	
	
func _on_body_entered(body: Node2D) -> void:
	
	player._player_bounce(0, -300.0)
	queue_free()
