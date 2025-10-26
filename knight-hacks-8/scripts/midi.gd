extends Node2D
@onready var bullet = preload("res://objects/bullet.tscn")

# Called when the node enters the scene tree for the first time.

func _on_midi_player_midi_event(channel: Variant, event: Variant) -> void:
	if channel.number < 4:
		#print(event.type)
		if event.type == 144:
			#print(channel.number)
			CreateBullet(channel.number)

func CreateBullet(channel: int):
	var bullet_inst = bullet.instantiate()
	get_tree().get_root().call_deferred("add_child", bullet_inst)
	bullet_inst.setBullet(get_parent().get_node("triCatcher").position.y, channel + 4)
	
	Global.bullet_queue.push_back(bullet_inst)
