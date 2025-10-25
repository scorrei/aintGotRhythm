extends Sprite2D
@onready var bullet = preload("res://obects/bullet.tscn")
@export var button_name: String = ""



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed(button_name):
		CreateBullet()

func CreateBullet():
	var bullet_inst = bullet.instantiate()
	get_tree().get_root().call_deferred("add_child", bullet_inst)
	bullet_inst.setBullet(position.y)
