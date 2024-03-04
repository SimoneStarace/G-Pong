class_name PauseMenu extends Control

func _ready():
	$MarginContainer/ContinueButton.pressed.connect(hide_menu)

func show_menu():
	get_tree().paused = true
	show()

func hide_menu():
	hide()
	get_tree().paused = false

