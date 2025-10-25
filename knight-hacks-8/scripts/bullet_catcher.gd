extends Sprite2D

@export var button_name: String = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed(button_name):
		print(button_name)
