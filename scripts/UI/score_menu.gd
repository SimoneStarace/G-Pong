class_name ScoreMenu extends Control

## Reference to the score labels
var _score_labels:Array[Label]

func _ready():
	# Get all the Label nodes
	for sl in get_children():
		if sl is Label:
			_score_labels.append(sl)

## Sets the text to one of the score labels
func set_score_value(index:int, value:int):
	if index < len(_score_labels):
		_score_labels[index].text = str(value)
	elif OS.has_feature("debug"):
		push_warning("Index out of range. There are only " + str(len(_score_labels)) + " score labels.")
