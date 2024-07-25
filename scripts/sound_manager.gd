extends Node2D

@onready var death_sound: AudioStreamPlayer2D = $DeathSound

func playMobDeathSound() -> void:
	death_sound.play(0)
