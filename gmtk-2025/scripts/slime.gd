extends Area2D

const SPEED = 40
var direction = -1

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var player: CharacterBody2D = get_node("/root/Game/Player")
@onready var killzone: Area2D = $Killzone

func _process(delta):
	
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = false
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = true
	
	position.x += direction * SPEED * delta
	
func _on_body_entered(body: Node2D) -> void:
	
	$Killzone/CollisionShape2D.disabled = true
	player._player_bounce(0, -300.0)
	animated_sprite.play("death")
	await animated_sprite.animation_finished
	queue_free()
	
	
	
