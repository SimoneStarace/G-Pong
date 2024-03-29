class_name Ball extends Area2D

## Initial speed of the ball
const _initial_speed:int = 300
## Movement speed of the ball
@export var _speed:int = _initial_speed
## Reference to the size of the viewport
@onready var _center_screen:Vector2 = get_viewport_rect().size / 2
## Sound effect of the ball.
@onready var _sfx:AudioStreamPlayer = $SoundEffectStream
## Direction of the ball
var _direction:Vector2 = Vector2.RIGHT

func _ready():
	if OptionManager._sound_on and _sfx.stream != null and !self.area_entered.is_connected(collision_sound):
		self.area_entered.connect(collision_sound)

func _process(delta):
	# Change the position of the ball
	global_position += delta * _direction * _speed 

## Resets the ball position to the center of the screen
func reset():
	global_position = _center_screen
	_speed = _initial_speed

## Makes the sound when the it collides to a wall or a paddle
func collision_sound(area):
	if area is Paddle or area is Wall:
		_sfx.play()
