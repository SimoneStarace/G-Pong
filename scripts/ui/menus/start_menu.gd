class_name StartMenu extends Control

func load_game_scene():
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_player_button_pressed():
	load_game_scene()

func _on_ai_button_pressed():
	load_game_scene()
