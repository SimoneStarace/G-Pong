class_name Game extends Node

## Reference to the ball in the scene
@onready var _ball:Ball = $Ball
## Reference to the score menu
@onready var _score_menu:ScoreMenu = $ScoreMenu
## Reference to the score values
var _score_values:Array[int]

func _ready():
	# Connect the notifier signal
	_ball._2d_notifier.screen_exited.connect(_on_ball_exited)
	# For each score label set the score value to 0
	for x in range(len(_score_menu._score_labels)):
		_score_values.append(0)
		_score_menu.set_score_value(x, _score_values[x])
	
## Function to execute when the ball goes out
func _on_ball_exited():
	# Check if the ball exited on the left or on the right
	if _ball.global_position.x < 0:
		reset_ball(Vector2.LEFT)
		increase_score(1)
	else:
		reset_ball(Vector2.RIGHT)
		increase_score(0)

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
