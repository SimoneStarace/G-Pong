extends Node

## Maximum amount of points to score to finish the game session.
@export_range(1,100) var _max_score:int = 10
## The Difficulty for the A.I.
@export_enum("Easy", "Normal", "Hard") var _difficulty:int = 1
@export_category("Colors")
## Color for the left paddle.
@export_color_no_alpha var _left_paddle_color:Color = Color.WHITE
## Color for the right paddle.
@export_color_no_alpha var _right_paddle_color:Color = Color.WHITE
## Color for the ball.
@export_color_no_alpha var _ball_color:Color = Color.WHITE
## Color for the field separator.
@export_color_no_alpha var _separator_color:Color = Color.WHITE
## Color for the background.
@export_color_no_alpha var _background_color:Color = Color.BLACK
