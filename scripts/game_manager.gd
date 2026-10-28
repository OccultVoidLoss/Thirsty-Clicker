extends Node

var points: int = 0
var clickpower: int = 1
signal points_changed
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func get_points() -> void:
	points += clickpower
	points_changed.emit()

func upgrade_clickpower(cost: int, new_clickpower: int) -> bool:
	if (points >= cost):
		points -= cost
		clickpower = new_clickpower
		points_changed.emit()
		return true
	else:
		return false
