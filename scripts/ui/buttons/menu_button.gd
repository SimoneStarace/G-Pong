extends Button

@export var _menu_name:String

func _ready():
	self.pressed.connect(func():
		get_tree().change_scene_to_file("res://scenes/ui/menus/"+ _menu_name.to_lower() + ".tscn")
	)
