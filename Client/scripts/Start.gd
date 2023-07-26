extends Node
var flag=0

var app_size = OS.window_size
# Called when the node enters the scene tree for the first time.
func _ready():
	$HTTPRequest.connect("request_completed", self, "_on_request_completed")
	Show("black")
	Show("mylogo")
	yield(get_tree().create_timer(2), "timeout")
	
	Show("title")
	GameMaster.start_sound = self.get_node("title/sound")
	GameMaster.start_sound.play(0.0)
	#self.get_node("title/TouchScreenButton").shape.set("extents", app_size)

func Show(parameter: String):
	var nodo = self.get_node(parameter)
	nodo.visible = true

func _on_TouchScreenButton_pressed():
	if(flag==0):
		$HTTPRequest.request(GameMaster.server) #add error response
		flag=1

func _on_request_completed(result, response_code, headers, body):
	print(body.get_string_from_utf8())
	if(GameMaster.id_client == null):
		print("no account")
		get_tree().change_scene("res://Loading/Load.tscn")
		

func _on_Account_pressed():
	#DO A MODAL
	pass
