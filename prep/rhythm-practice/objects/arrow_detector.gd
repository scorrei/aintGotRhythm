extends Sprite2D

@onready var fallingArrow = preload("res://objects/fallingArrow.tscn")
@export var key_name: String = ""

var falling_key_queue = []

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	if falling_key_queue.size() > 0:
		if falling_key_queue.front().has_passed:
			falling_key_queue.pop_front()

	
	if Input.is_action_just_pressed(key_name):
		var arrow_to_pop = falling_key_queue.pop_front()
		
		var distance_from_pass = abs(arrow_to_pop.pass_threshold - arrow_to_pop.global_position.x)
		print(distance_from_pass)
		arrow_to_pop.queue_free()

func CreateFallingArrow():
	var fa_inst = fallingArrow.instantiate()
	get_tree().get_root().call_deferred("add_child", fa_inst)
	fa_inst.Setup(position.y, frame +4)
	
	falling_key_queue.push_back(fa_inst)
	


func _on_random_spawn_timer_timeout() -> void:
	CreateFallingArrow()
	$RandomSpawnTimer.wait_time = randf_range(0.4, 3)
	$RandomSpawnTimer.start()
	
