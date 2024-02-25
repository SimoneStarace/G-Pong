class_name WinScreen extends Control

## Label to show the winner player
@onready var _winner_label:Label = $MarginContainer/WinnerLabel

func _ready():
	# Connect the button signals with lambda functions
	$MarginContainer/ReplayButton.pressed.connect(func():
		get_tree().reload_current_scene()
	)

## Sets the winner label text
func set_winner_text(text:String) -> void:
	_winner_label.text = text
