class_name Paddle extends Area2D

## Movement speed of the paddle
@export var _speed:int = 100

func _process(delta):
	# Take the direction
	var direction = Input.get_axis("move_up", "move_down")
	# Change the position
	position.y += delta * direction * _speed
