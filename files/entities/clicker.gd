extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

@export var sprite_size : float = 32.0
@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	sprite.position = size / 2.0 # coloca o sprite no meio
	var new_scale = min(size.x, size.y) / sprite_size
	sprite.scale = Vector2(new_scale, new_scale)
	# codigo maldito pra escalar certo
	# lembrete: nunca mais usar um node2d dentro de um node de control
	pass


func _on_pressed() -> void:
	GameManager.get_points()
