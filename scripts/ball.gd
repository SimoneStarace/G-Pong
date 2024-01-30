class_name Ball extends Area2D

## Movement speed of the ball
@export var _speed:int = 300

@onready var _2d_notifier = $VisibleOnScreenNotifier2D

var _direction:Vector2 = Vector2.RIGHT

func _process(delta):
	global_position += delta * _direction * _speed 
