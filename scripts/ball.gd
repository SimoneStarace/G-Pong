class_name Ball extends Area2D

## Initial speed of the ball
const _initial_speed:int = 300
## Movement speed of the ball
@export var _speed:int = _initial_speed
## Reference to the screen notifier 2D
@onready var _2d_notifier:VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D
## Reference to the size of the viewport
@onready var _center_screen:Vector2 = get_viewport_rect().size / 2
## Direction of the ball
var _direction:Vector2 = Vector2.RIGHT

func _process(delta):
	# Change the position of the ball
	global_position += delta * _direction * _speed 

## Resets the ball position to the center of the screen
func reset():
	global_position = _center_screen
	_speed = _initial_speed
