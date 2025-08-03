extends Node

@onready var label: Label = $"."
@onready var extra_time: Label = $"../ExtraTime"
@onready var timer: Timer = $"../Timer"
@onready var player: CharacterBody2D = get_node("/root/Game/Player")
@onready var death: Label = $"../Death"
@onready var looping: Label = $"../Looping"

var time = 10
var seconds = 10

func _ready() -> void:
	GlobalTimer.timer += 10
	time = GlobalTimer.timer
	timer.wait_time = time
	GlobalTimer.timer = 0
	timer.start()
	
	
func _process(_delta):
	label.text = time_to_string()
	extra_time.text = time_to_seconds()
	death.text = show_death()
	looping.text = show_looping()
	
	if Input.is_action_just_pressed("loop"):
		seconds = 0
		_ready()
		player._reset_player()
	
func show_looping():
	var msec = fmod(timer.time_left, 1) * 1000
	var loop_string = "Looping in : %02d : %02d" % [timer.time_left, msec]
	
	if fmod(timer.time_left, 1) < 0.5:
		looping.visible = true
	else:
		looping.visible = false
		
	if timer.time_left <= 5.0:
		return loop_string 
	else:  
		return ""
	
func show_death():
	
	if GlobalTimer.death:
		return "You Died!"
	else:
		return ""
	
func time_to_seconds():
	seconds = 10 + GlobalTimer.timer
	var format_time_string = "Seconds Next Round : %02d"
	var time_string = format_time_string % [seconds]
	return time_string
		
		
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
	seconds = 0
	_ready()
	player._reset_player()
	
