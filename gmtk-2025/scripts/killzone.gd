extends Area2D

@onready var timer: Timer = $Timer
@onready var deathsounds: AudioStreamPlayer2D = $Deathsounds

func _on_body_entered(body: Node2D) -> void:
	GlobalTimer.death = true
	GlobalTimer.glide_state = false
	GlobalTimer.timer = 0
	Engine.time_scale = 0.5
	deathsounds.play()
	body.get_node("CollisionShape2D").queue_free()
	timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	GlobalTimer.death = false
	GlobalTimer.checkpoint = false
	GlobalTimer.checkpoint2 = false
	GlobalTimer.checkpoint3 = false
	get_tree().reload_current_scene()
