class_name VisibilityButton extends Button
## Class for show and hide nodes

@export var _node2show:Node
@export var _node2hide:Node

func _ready():
	self.pressed.connect(func():
		if _node2show != null and _node2hide != null:
			_node2hide.visible = false
			_node2show.visible = true
	)
