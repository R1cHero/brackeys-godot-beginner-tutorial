extends Node2D

const SPEED = 60
var direction = -1

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D
@onready var death_sound = $DeathSound

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	position.x += direction * SPEED * delta

# BUG düşman ölürken bug var
func _on_area_2d_body_entered(body):
		if body.name == "Player":
			self.queue_free()
			death_sound.play(0)
			# FIXME Ses gelmiyor düzelt amk
