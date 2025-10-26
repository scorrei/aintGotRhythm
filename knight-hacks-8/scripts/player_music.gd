extends Node2D

signal on_midi_event(channel: Variant, event: Variant)

func _on_timer_timeout():
	print("done")
	self.get_child(0).play()


func _on_midi_player_midi_event(channel: Variant, event: Variant) -> void:
	if channel.number < 4:
		print("yay!")
