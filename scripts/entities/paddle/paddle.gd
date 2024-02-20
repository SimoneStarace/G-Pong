class_name Paddle extends Area2D

## Movement speed of the paddle
@export var _speed:int = 600
## Hit direction to apply
@export_enum("Left:-1", "Right:1") var _hit_direction = 1
## The size, in the y direction, of the collision shape halved
@onready var _size_y:float = $CollisionShape2D.shape.size.y/2
## The size of the screen in the y direction
@onready var _screen_size_y:float = get_viewport_rect().size.y
## The difference of sizes between the collision shape and the viewport
@onready var _diff:float = abs(_screen_size_y - _size_y)

func _ready():
	self.area_entered.connect(_on_area_entered)

## Function to apply on area_entered signal
func _on_area_entered(area):
	# If the ball is entered
	if area is Ball:
		# Increase the speed
		area._speed += randi_range(25, 50)
		# Get the difference in position of the two objects
		var pos_diff = (area.global_position - self.global_position).normalized().y
		# Change the direction
		area._direction = Vector2(_hit_direction, pos_diff)

## Moves the paddle
func move(direction:float, delta:float):
		# Change the position
	self.global_position.y += delta * direction * _speed
	self.global_position.y = global_position.clamp(Vector2(0,_size_y),Vector2(0,_diff)).y
