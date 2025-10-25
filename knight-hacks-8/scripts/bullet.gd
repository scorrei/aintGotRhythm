extends Sprite2D

@export var speed: float = 3.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position -= Vector2(speed, 0)
	
	if global_position.x < -300 and not $Timer.is_stopped():
		print($Timer.time_left)
		$Timer.stop()
