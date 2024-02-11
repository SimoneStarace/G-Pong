class_name Ball extends Area2D

## Initial speed of the ball
const _initial_speed:int = 300
## Movement speed of the ball
@export var _speed:int = _initial_speed
## Reference to the screen notifier 2D
@onready var _2d_notifier:VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
## Direction of the ball
var _direction:Vector2 = Vector2.RIGHT

func _process(delta):
	# Change the position of the ball
	global_position += delta * _direction * _speed 
