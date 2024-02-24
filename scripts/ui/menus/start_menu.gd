class_name StartMenu extends Control

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://scenes/UI/option_menu.tscn")
