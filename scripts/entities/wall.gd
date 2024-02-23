class_name Wall extends Area2D

func _ready():
	# Connect the signal on start
	self.area_entered.connect(_on_area_entered)

func _on_area_entered(area):
	if area is Ball:
		# Increase the speed of ball
		area._speed += randi_range(15, 20)
		# Change direction
		area._direction.y = -area._direction.y
