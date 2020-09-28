extends Control

var money = 1000000
var launches = 0
var has_rocket = false
var rocket_scene = load("res://Rocket.tscn")
var rocket

func _on_Buy_pressed():
	# Check for rocket and then create a new one.
	if not has_rocket:
		money -= 1000000
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
	money += 2000000
	$GUI/Cols/Stats/Rows/Money.text = "$" + str(money)
	
	launches += 1
	$GUI/Cols/Stats/Rows/Launches/Counter.text = str(launches)
	
	has_rocket = false
	rocket.queue_free()
