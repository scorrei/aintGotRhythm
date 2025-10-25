extends Node2D

var action = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_midi_player_midi_event(channel: Variant, event: Variant) -> void:
	
	
	if channel.number == 0:
		print(event.type)
		if event.type == 128:
			if action == 0:
				$Icon.global_position.x += 50
				action = 1
			elif action == 1:
				$Icon.global_position.x -= 50
				action = 0
	
