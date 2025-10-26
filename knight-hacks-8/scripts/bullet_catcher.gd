extends Sprite2D
@onready var bullet = preload("res://objects/bullet.tscn")
@export var button_name: String = ""
@export var place: float = position.y
var bullet_to_pop = null

var perfect_press_threshold: float = 30
var great_press_threshold: float = 50
var good_press_threshold: float = 60
var ok_press_threshold: float = 80

var perfect_press_score: float = 250
var great_press_score: float = 100
var good_press_score: float = 75
var ok_press_score: float = 50

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.bullet_queue.size() > 0:
		if Global.bullet_queue.front().has_passed:
			Global.bullet_queue.pop_front()
	
	if Input.is_action_just_pressed(button_name):
		
		if (Global.bullet_queue.front() != null):
			# check if button matches bullet
			if ((button_name == "button_Square") and (Global.bullet_queue.front().frame == 4)) or ((button_name == "button_X") and (Global.bullet_queue.front().frame == 5)) or ((button_name == "button_Triangle") and (Global.bullet_queue.front().frame == 6)) or ((button_name == "button_Circle") and (Global.bullet_queue.front().frame == 7)):
					bullet_to_pop = Global.bullet_queue.pop_front()
		
		if bullet_to_pop != null:
			
			var distance_from_pass = abs(bullet_to_pop.pass_threshold - bullet_to_pop.global_position.x)
			
			print(distance_from_pass)
			
			if distance_from_pass < perfect_press_threshold:
				Global.IncrementScore.emit(perfect_press_score)
			elif distance_from_pass < great_press_threshold:
				Global.IncrementScore.emit(great_press_score)
			elif distance_from_pass < good_press_threshold:
				Global.IncrementScore.emit(good_press_score)
			elif distance_from_pass < ok_press_threshold:
				Global.IncrementScore.emit(ok_press_score)
			else:
				pass
			
			bullet_to_pop.queue_free()
