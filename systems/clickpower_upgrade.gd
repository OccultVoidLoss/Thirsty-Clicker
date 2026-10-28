extends Button

@export var new_clickpower : int 
@export var cost : int
@onready var button_label = $Button_label
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button_label.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	if (GameManager.upgrade_clickpower(cost, new_clickpower)):
		queue_free()
	else:
		button_label.visible = true
		button_label.text = "Not enough blood!"
		await get_tree().create_timer(4.0).timeout
		button_label.visible = false
