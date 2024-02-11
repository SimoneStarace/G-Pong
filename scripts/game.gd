class_name Game extends Node

## Reference to the ball in the scene
@onready var _ball:Ball = $Ball

func _ready():
	# Connect the notifier signal
	_ball._2d_notifier.screen_exited.connect(_on_ball_exited)
	
## Function to execute when the ball goes out
func _on_ball_exited():
	# Check if the ball exited on the left or on the right
	if _ball.global_position.x < 0:
		reset_ball()
	else:
		reset_ball()

## Resets the ball
func reset_ball():
	# Put the ball at the center and don't move it.
	_ball._direction = Vector2.ZERO
	_ball.reset_position()
