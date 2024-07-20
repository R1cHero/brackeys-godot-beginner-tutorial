extends Area2D

func _on_body_entered():
	get_tree().change_scene_to_file("res://scenes/level2.tscn")
	#get_node("res://scenes/game.tscn").free()
