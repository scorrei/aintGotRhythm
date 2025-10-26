extends Node2D

signal on_midi_event(channel: Variant, event: Variant)

func _on_timer_timeout():
	self.get_child(0).play()
