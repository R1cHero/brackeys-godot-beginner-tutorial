extends Area2D

@onready var timer = $Timer
@onready var hurt_sound = $HurtSound

func _on_body_entered(body):
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").call_deferred("queue_free")
	hurt_sound.play(0)
	timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
