extends Node2D

const SPEED = 60

var direction = 1

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D
@onready var ray_cast_bottom = $RayCastBottom

func _process(delta):
	# Detect lateral collisions
	if ray_cast_right.is_colliding() and direction == 1:
		direction = -1
		animated_sprite.flip_h = false
	elif ray_cast_left.is_colliding() and direction == -1:
		direction = 1
		animated_sprite.flip_h = true
	
	# Detect cliffs
	if not ray_cast_bottom.is_colliding():
		if direction == 1:
			direction = -1
			animated_sprite.flip_h = false
		elif direction == -1:
			direction = 1
			animated_sprite.flip_h = true
	
	# Update position
	position.x += direction * SPEED * delta
