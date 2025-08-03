extends CharacterBody2D

@onready var killzone: Area2D = $Killzone
@export var SPEED = 100
@onready var life: Timer = $Life

var dir : float
var spawnPos : Vector2
var spawnRot : float

func _ready():
	global_position = spawnPos
	global_rotation = spawnRot
	
	killzone.body_entered.connect(_on_KillZone_body_entered)
	
func _on_KillZone_body_entered(_body: Node) -> void:
	life.stop()
	
	
func _physics_process(_delta: float) -> void:
	velocity = Vector2(0, -SPEED).rotated(dir)
	move_and_slide()

func _on_life_timeout() -> void:
	queue_free()
