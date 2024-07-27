extends CharacterBody2D

const SPEED := 130.0
const JUMP_VELOCITY := -280.0
const GRAVITY := 1000
const FALL_GRAVITY := 1500

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var jump: AudioStreamPlayer2D = $Jump

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += get_gravity() * delta

	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y = JUMP_VELOCITY / 4
	
	# Handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump.play(0)

	# Get the input direction: -1, 0, 1
	var direction := Input.get_axis("move_left", "move_right")
	
	# Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	# Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
 
# Gravity calc
func get_gravity() -> int:
	if velocity.y < 0:
		return GRAVITY
	return FALL_GRAVITY

func _on_area_2d_body_entered() -> void:
	get_tree().change_scene_to_file("res://scenes/level2.tscn")

func _on_change_scene_body_entered() -> void:
	get_tree().change_scene_to_file("res://scenes/level3.tscn")
