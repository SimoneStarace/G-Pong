class_name WinScreen extends Control

@onready var _winner_label:Label = $WinnerLabel

## Sets the winner label text
func set_winner_text(text:String):
	_winner_label.text = text
