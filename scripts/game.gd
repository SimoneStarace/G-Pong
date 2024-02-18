class_name Game extends Node

## Maximum amount of point to score
const _max_score:int = 10
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
		## TODO Show which player won
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
