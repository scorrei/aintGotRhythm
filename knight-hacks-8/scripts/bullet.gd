extends Sprite2D

@export var speed: float = 3.0
var initial_x: float = 200

var has_passed: bool = false
var pass_threshold = -390

func _init():
	set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position -= Vector2(speed, 0)
	if global_position.x < pass_threshold and not $Timer.is_stopped():
		$Timer.stop()
		has_passed = true
		

func setBullet(target_y: float, frame_num: int):
	global_position = Vector2(initial_x, target_y)
	frame = frame_num
	set_process(true)

func _on_destroy_timer_timeout() -> void:
	queue_free()
