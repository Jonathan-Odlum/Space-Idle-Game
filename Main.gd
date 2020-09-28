extends Control

var money = 1000000
var launches = 0


func change_money(delta_dollar):
	money += delta_dollar
	$GUI/Box/Cols/Stats/Rows/Money.text = "$" + str(money)


func increment_launches():
	launches += 1
	$GUI/Box/Cols/Stats/Rows/Launches/Counter.text = str(launches)
