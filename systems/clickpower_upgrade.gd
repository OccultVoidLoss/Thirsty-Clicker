extends Button


@onready var button_label = $Button_label


@export var max_level : int = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GameManager.clickpower_level > max_level:
		queue_free()
		return
	button_label.visible = false
	update_text()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_text() -> void:
	text = "Level %d \n Cost: %d" % [GameManager.clickpower_level, GameManager.clickpower_level*10]

func _on_pressed() -> void:
	
	
	if (GameManager.upgrade_clickpower(GameManager.clickpower_level * 10, GameManager.clickpower_level*2)):
		GameManager.clickpower_level +=1
		if GameManager.clickpower_level > max_level:
			queue_free()
			return
		update_text()
	else:
		button_label.visible = true
		button_label.text = "Not enough blood!"
		button_label.position = Vector2(0, size.y + 5)
		await get_tree().create_timer(2.0).timeout
		button_label.visible = false
