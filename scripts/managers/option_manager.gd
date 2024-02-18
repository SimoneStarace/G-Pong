extends Node

@export_range(1,100) var _max_score:int = 10
@export_enum("Easy", "Normal", "Hard") var _difficulty:int = 1
@export_category("Colors")
@export_color_no_alpha var _left_paddle_color:Color = Color.WHITE
@export_color_no_alpha var _right_paddle_color:Color = Color.WHITE
@export_color_no_alpha var _ball_color:Color = Color.WHITE
@export_color_no_alpha var _background_color:Color = Color.BLACK
