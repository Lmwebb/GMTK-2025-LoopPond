extends Node

@onready var label: Label = $"."
@onready var timer: Timer = $"../Timer"
@onready var player: CharacterBody2D = get_node("/root/Game/Player")

var time = 10
signal timer_done()

func _ready() -> void:
	time += GlobalTimer.timer
	timer.wait_time = time
	GlobalTimer.timer = 0
	timer.start()
	
func _process(delta):
	label.text = time_to_string()
		
		
# Converts time to string miliseconds, seconds, and minutes
func time_to_string() -> String:
	var time_left = timer.time_left
	var msec = fmod(time_left, 1) * 1000
	var sec = fmod(time_left, 60)
	var minute = time_left / 60
	var format_string = "%02d : %02d : %02d"
	var actual_string = format_string % [minute, sec, msec]
	return actual_string
	
func _on_timer_timeout() -> void:
	_ready()
	player._reset_player()
