extends Sprite2D

@export var speed: float = 3.0
var initial_x: float = 200


func _init():
	set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position -= Vector2(speed, 0)
	
	if global_position.x < -300 and not $Timer.is_stopped():
		print($Timer.time_left)
		$Timer.stop()
func setBullet(target_y: float):
	global_position = Vector2(initial_x, target_y)
	set_process(true)
