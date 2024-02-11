class_name Wall extends Area2D

## Direction to apply when the ball touches the wall
@export_enum("Up:-1", "Down:1") var _bounce_direction = 1

func _ready():
	# Connect the signal on start
	self.area_entered.connect(_on_area_entered)

func _on_area_entered(area):
	if area is Ball:
		# Change direction
		area._direction = Vector2(0, _bounce_direction)
