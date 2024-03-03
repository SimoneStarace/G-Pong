class_name PauseMenu extends Control

func _ready():
	$MarginContainer/ContinueButton.pressed.connect(hide_menu)

func show_menu():
	get_tree().paused = true
	self.visible = true

func hide_menu():
	self.visible = false
	get_tree().paused = false

