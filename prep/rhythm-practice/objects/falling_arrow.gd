extends Sprite2D

@export var fall_speed: float = 10

var init_x_pos: float = 610

# true if falling arrow has passed the allowed input frame
var has_passed: bool = false
var pass_threshold = -540

func _init():
	set_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position -= Vector2(fall_speed, 0)
	
	if global_position.x < pass_threshold and not $Timer.is_stopped():
		# print($Timer.wait_time - $Timer.time_left)
		$Timer.stop()
		has_passed = true
		

func Setup(target_y: float, target_frame: int):
	global_position = Vector2(init_x_pos, target_y)
	frame = target_frame
	# print(global_position)
	set_process(true)

func _on_destroy_timer_timeout() -> void:
	queue_free()
