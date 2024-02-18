class_name OptionMenu extends Control

@onready var _spin_box_score:SpinBox = $Options/ScoreOption/SpinBox
@onready var _left_color_button:ColorPickerButton = $Options/LeftPaddleOption/ColorPickerButton
@onready var _right_color_button:ColorPickerButton = $Options/RightPaddleOption/ColorPickerButton
@onready var _background_color_button:ColorPickerButton = $Options/BackgroundOption/ColorPickerButton

func _ready():
	_spin_box_score.value = OptionManager._max_score
	# Set the colors
	_left_color_button.color = OptionManager._left_paddle_color
	_right_color_button.color = OptionManager._right_paddle_color
	_background_color_button.color = OptionManager._background_color

	# Connect the signals
	_spin_box_score.value_changed.connect(func(value:float):
		OptionManager._max_score = int(value)
	)
	
	_left_color_button.popup_closed.connect(func():
		OptionManager._left_paddle_color = _left_color_button.color 
	)
	
	_right_color_button.popup_closed.connect(func():
		OptionManager._right_paddle_color = _right_color_button.color
	)
	
	_background_color_button.popup_closed.connect(func():
		OptionManager._background_color = _background_color_button.color
	)

func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/UI/start_menu.tscn")
