extends Node
var id_client = 1
var server = "http://localhost:9000/get"
var flag = 0
# "http://www.mocky.io/v2/5185415ba171ea3a00704eed"
# Declare member variables here. Examples:
#var a = 8
var app_size = OS.window_size
# Called when the node enters the scene tree for the first time.
func _ready():
	$HTTPRequest.connect("request_completed", self, "_on_request_completed")
	
	Show("alim")
	yield(get_tree().create_timer(3.5), "timeout")
	
	Show("gumi")
	yield(get_tree().create_timer(2.5), "timeout")
	
	Show("title")
	Show("title")
	self.get_node("title/sound").play(0.0)
	#self.get_node("title/TouchScreenButton").shape.set("extents", app_size)
	pass # Replace with function body.

func Show(parameter: String):
	var nodo = self.get_node(parameter)
	nodo.visible = true

func _on_title_gui_input(event):
	if(Input.is_action_pressed("click")):
		if(flag==0):
			$HTTPRequest.request(server)
			flag=1

func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	print(json.result)
#	get_tree().change_scene("res://Home.tscn")
