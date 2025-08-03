extends Camera2D

@onready var camera: Camera2D = $"."
var check = false
@onready var timer: Timer = $Timer

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("camera") and !check:
		check = true
		camera.zoom = Vector2(2.0,2.0)
	elif Input.is_action_just_pressed("camera") and check:
		check = false
		camera.zoom = Vector2(5.0,5.0)
		
