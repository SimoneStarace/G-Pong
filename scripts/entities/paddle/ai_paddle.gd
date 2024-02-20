class_name AIPaddle extends Paddle

## Reference to the ball.
var _ball:Ball

func _ready():
	## Call the base class method
	super()
	# Get the reference to  the ball
	_ball = get_tree().get_first_node_in_group("ball")

func _process(delta):
	# If the ball exists and it's going into the right direction then follow it.
	if _ball != null and _ball._direction.x > 0:
		# Get the direction and move it
		var direction:float = Vector2.ZERO.y if self.global_position.y == _ball.global_position.y else Vector2.DOWN.y if _ball.global_position.y > self.global_position.y else Vector2.UP.y
		move(direction, delta)
