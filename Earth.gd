extends Control

var has_rocket = false
var rocket_scene = load("res://Rocket.tscn")
var rocket


func _on_Buy_pressed():
	# Check for rocket and then create a new one.
	if not has_rocket:
		get_tree().get_root().get_node("Main").change_money(-1000000)
		rocket = rocket_scene.instance()
		rocket.position = Vector2(773,525)
		add_child(rocket)
		rocket.connect("in_orbit", self, "_on_RigidBody2D_in_orbit")
		has_rocket = true


func _on_Launch_pressed():
	if has_rocket and rocket.linear_velocity == Vector2(0,0):
		# Give rocket force
		rocket.add_force(Vector2(0,0), Vector2(0,-1000))


func _on_RigidBody2D_in_orbit():
	# When rocket leaves screen give monies and increment launches
	get_tree().get_root().get_node("Main").change_money(2000000)
	
	get_tree().get_root().get_node("Main").increment_launches()
	
	has_rocket = false
	rocket.queue_free()
