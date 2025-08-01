extends Area2D

@onready var timer: Timer = $Timer
@onready var death: Label = $Death

func _on_body_entered(body: Node2D) -> void:
	GlobalTimer.death = true
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	GlobalTimer.death = false
	get_tree().reload_current_scene()
