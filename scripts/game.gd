class_name Game extends Node
## Main class to handle the Game logic

## Maximum amount of point to score
@onready var _max_score:int = OptionManager._max_score
## Reference to the ball in the scene
@onready var _ball:Ball = $Ball
## Reference to the score menu
@onready var _score_menu:ScoreMenu = $ScoreMenu
## Reference to the win screen
@onready var _win_screen:WinScreen = $WinScreen
## Reference to the score values
var _score_values:Array[int]	

func _ready():
	# Connect the signal on each score area
	for sa in get_tree().get_nodes_in_group("score_area"):
		sa.area_exited.connect(_on_ball_exited)
	
	var _num_scores:int = len(_score_menu._score_labels)
	# For each score label set the score value to 0
	for x in range(_num_scores):
		_score_values.append(0)
		_score_menu.set_score_value(x, _score_values[x])
	
	# Set the colors
	$BackgroundColorField.color = OptionManager._background_color
	$Paddles/LeftPaddle/ColorRect.color = OptionManager._left_paddle_color
	$Separator.self_modulate = OptionManager._separator_color
	_ball.get_node("ColorRect").color = OptionManager._ball_color

	if _num_scores == 2:
		_score_menu._score_labels[0].label_settings.font_color = OptionManager._left_paddle_color
		_score_menu._score_labels[1].label_settings.font_color = OptionManager._right_paddle_color

	if OptionManager._playing_with_ai:
		var ai_paddle = $Paddles/RightPaddleAI
		ai_paddle.get_node("ColorRect").color = OptionManager._right_paddle_color
		# Set the speed based on difficulty
		if OptionManager._difficulty == 0:
			ai_paddle._speed = 500
		elif OptionManager._difficulty == 2:
			ai_paddle._speed = 700
		# Remove Right Paddle controlled by the player
		$Paddles/RightPaddle.queue_free()
	else:
		$Paddles/RightPaddle/ColorRect.color = OptionManager._right_paddle_color
		$Paddles/RightPaddleAI.queue_free()

	# Random start position of the ball
	reset_ball(Vector2.LEFT if randi_range(0,1) == 0 else Vector2.RIGHT)

## Function to execute when the ball goes out
func _on_ball_exited(area):
	var direction2reset:Vector2
	var index2increase:int
	# Check if the ball exited on the left or on the right
	if _ball.global_position.x < 0:
		direction2reset = Vector2.LEFT
		index2increase = 1
	else:
		direction2reset = Vector2.RIGHT
		index2increase = 0
	
	increase_score(index2increase)
	# Check if one of the scores reaches the max value
	if _score_values[index2increase] >= _max_score:
		# Remove the paddle and the ball
		$Paddles.queue_free()
		_ball.queue_free()
		# Show the winner
		if len(_score_values) == 2:
			_win_screen.set_winner_text("Player 1 Wins") if _score_values[0] > _score_values[1] else _win_screen.set_winner_text("Player 2 Wins")
		
		_win_screen.visible = true
	else:
		reset_ball(direction2reset)

## Resets the ball
func reset_ball(direction:Vector2):
	# Put the ball at the center and don't move it.
	_ball._direction = Vector2.ZERO
	_ball.reset()
	# Add a small gap to let the player understand where the ball will launch
	_ball.global_position += Vector2(-100, 0) if direction == Vector2.LEFT else Vector2(100,0)
	# Wait for 1.5 seconds
	await get_tree().create_timer(1.5).timeout
	# Specify the direction
	_ball._direction = direction

## Increases the score value
func increase_score(index:int, value = 1):
	_score_values[index] += absi(value)
	_score_menu.set_score_value(index, _score_values[index])
