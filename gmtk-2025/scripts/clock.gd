extends Node

@onready var label: Label = $"."
@onready var timer: Timer = $"../Timer"
@onready var player: CharacterBody2D = $Player

var time = 10
signal timer_done()

func _ready() -> void:
	print("GlobalTimer just before time", int(GlobalTimer.timer))
	time += GlobalTimer.timer
	print("this is time", time)
	timer.wait_time = time
	# Maybe change
	GlobalTimer.timer = 0
	print(timer.wait_time, "timer wait time")
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
	get_tree().reload_current_scene()
	#_ready()
	#player.reset_position()
	#emit_signal("Timer is done", timer_done)
