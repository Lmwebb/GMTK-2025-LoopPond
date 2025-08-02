extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var checkpoint: Area2D = get_node("/root/Game/Checkpoint/checkpoint")
@onready var checkpoint2: Area2D = get_node("/root/Game/Checkpoint/checkpoint2")
@onready var checkpoint3: Area2D = get_node("/root/Game/Checkpoint/checkpoint3")

@onready var player: CharacterBody2D = $"."

const SPEED = 100.0
const JUMP_VELOCITY = -280.0
const BOUNCE_VELOCITY = -500.0

var glide_fall = 50
var initial_position: Vector2

func _ready():
	initial_position = position

func _reset_player():
	
	if GlobalTimer.checkpoint:
		position = checkpoint.position
	elif GlobalTimer.checkpoint2:
		position = checkpoint2.position
	elif GlobalTimer.checkpoint3:
		position = checkpoint3.position
	else:
		position = initial_position

func _player_bounce(delta: float, bounce: float) -> void:
	GlobalTimer.glide_state = false
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	velocity.y = bounce
	
func _physics_process(delta: float) -> void:
	
	var direction := Input.get_axis("move_left", "move_right")
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Controls glide
	if Input.is_action_just_pressed("glide") and velocity.y > 0:
		GlobalTimer.glide_state = true
	elif is_on_floor():
		GlobalTimer.glide_state = false
		
	if GlobalTimer.glide_state == true:
		velocity.y = glide_fall
		
	# flip sprite
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
		
	# Play animation
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("jump")
			
		
	# Apply movement
	if direction:
		if GlobalTimer.glide_state:
			velocity.x = direction * (SPEED/2)
		else:
			velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
