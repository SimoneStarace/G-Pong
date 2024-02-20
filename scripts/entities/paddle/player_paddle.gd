class_name PlayerPaddle extends Paddle

## Paddle movement comands
@export var _player_controller:PlayerController = preload("res://resources/player1_controller.tres")

func _process(delta):
	# Take the direction
	var direction = Input.get_axis(_player_controller.move_up, _player_controller.move_down)
	## Change direction
	move(direction, delta)
