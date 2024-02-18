class_name OptionMenu extends Control

@onready var _spin_box_score:SpinBox = $Options/ScoreOption/SpinBox
@onready var _difficulty_list:OptionButton = $Options/DifficultyOption/OptionButton
@onready var _left_color_picker:ColorPickerButton = $Options/LeftPaddleOption/ColorPickerButton
@onready var _right_color_picker:ColorPickerButton = $Options/RightPaddleOption/ColorPickerButton
@onready var _ball_color_picker:ColorPickerButton = $Options/BallOption/ColorPickerButton
@onready var _background_color_picker:ColorPickerButton = $Options/BackgroundOption/ColorPickerButton

func _ready():
	_spin_box_score.value = OptionManager._max_score
	_difficulty_list.select(OptionManager._difficulty)
	# Set the colors
	_left_color_picker.color = OptionManager._left_paddle_color
	_right_color_picker.color = OptionManager._right_paddle_color
	_background_color_picker.color = OptionManager._background_color
	_ball_color_picker.color = OptionManager._ball_color

	# Connect the signals
	_spin_box_score.value_changed.connect(func(value:float):
		OptionManager._max_score = int(value)
	)
	
	_difficulty_list.item_selected.connect(func(index:int):
		OptionManager._difficulty = index
	)
	
	_left_color_picker.popup_closed.connect(func():
		OptionManager._left_paddle_color = _left_color_picker.color
	)
	
	_right_color_picker.popup_closed.connect(func():
		OptionManager._right_paddle_color = _right_color_picker.color
	)
	
	_ball_color_picker.popup_closed.connect(func():
		OptionManager._ball_color = _ball_color_picker.color
	)

	_background_color_picker.popup_closed.connect(func():
		OptionManager._background_color = _background_color_picker.color
	)

func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/UI/start_menu.tscn")
