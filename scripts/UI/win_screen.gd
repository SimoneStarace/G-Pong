class_name WinScreen extends Control

## Label to show the winner player
@onready var _winner_label:Label = $WinnerLabel

func _ready():
	# Connect the button signals with lambda functions
	$ReplayButton.pressed.connect(func():
		get_tree().reload_current_scene()
	)
	$MenuButton.pressed.connect(func():
		get_tree().change_scene_to_file("res://scenes/UI/start_menu.tscn")
	)

## Sets the winner label text
func set_winner_text(text:String) -> void:
	_winner_label.text = text
