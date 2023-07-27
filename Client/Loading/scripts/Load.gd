extends Node2D

var time = 0.01
var loadingMessage = "Loading"

func _ready():
	
	get_child(2).text = loadingMessage
	yield(get_tree().create_timer(1), "timeout")
	get_child(2).text += '.'
	yield(get_tree().create_timer(1), "timeout")
	get_child(2).text += '.'
	yield(get_tree().create_timer(1), "timeout")
	get_child(2).text += '.'
	yield(get_tree().create_timer(1), "timeout")
	get_tree().change_scene("res://Home/Home.tscn")
