extends Node2D

@onready var player: CharacterBody2D = get_node("/root/Game/Player")

func _process(_delta):
	if Input.is_action_just_pressed("restart"):
		
		GlobalTimer.timer = 0
		GlobalTimer.checkpoint = false
		GlobalTimer.checkpoint2 = false
		GlobalTimer.checkpoint3 = false
		get_tree().reload_current_scene()
