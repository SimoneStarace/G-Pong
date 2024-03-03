class_name StartMenu extends Control

func _ready():
	# Make the game unpaused if it was paused during the game
	get_tree().paused = false

## Loads the game scene
func load_game_scene():
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_player_button_pressed():
	OptionManager._playing_with_ai = false
	load_game_scene()

func _on_ai_button_pressed():
	OptionManager._playing_with_ai = true
	load_game_scene()
