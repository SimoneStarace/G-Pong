class_name PlayerPaddle extends Paddle

## Paddle movement comands
@export var _player_controller:PlayerController = preload("res://resources/player1_controller.tres")

func _process(delta):
	# Take the direction
	var direction = Input.get_axis(_player_controller.move_up, _player_controller.move_down)
	# Change the position
	self.global_position.y += delta * direction * _speed
	self.global_position.y = global_position.clamp(Vector2(0,_size_y),Vector2(0,_diff)).y
