class_name Paddle extends Area2D

## Movement speed of the paddle
@export var _speed:int = 100
## The size, in the y direction, of the collision shape halved
@onready var _size_y:float = $CollisionShape2D.shape.size.y/2
## The size of the screen in the y direction
@onready var _screen_y_size:float = get_viewport_rect().size.y
## The difference of sizes between the collision shape and the viewport
@onready var _diff:float = abs(_screen_y_size - _size_y)

func _process(delta):
	# Take the direction
	var direction = Input.get_axis("move_up", "move_down")
	# Change the position
	self.global_position.y += delta * direction * _speed
	self.global_position = global_position.clamp(Vector2(0,_size_y),Vector2(0,_diff))
