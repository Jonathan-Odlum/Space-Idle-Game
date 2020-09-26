extends RigidBody2D

signal in_orbit

func _on_VisibilityNotifier2D_screen_exited():
	emit_signal("in_orbit")
