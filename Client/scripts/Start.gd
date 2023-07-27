extends Node
var flag=0

var app_size = OS.window_size
# Called when the node enters the scene tree for the first time.
func _ready():
	$HTTPRequest.connect("request_completed", self, "_on_request_completed")
	$Settings/Form/loginRequest.connect("request_completed", self, "_on_user_info_completed")
	Show("black")
	Show("mylogo")
	if(GameMaster.id_client == null):
		self.get_node("Settings/Form").visible = true
	yield(get_tree().create_timer(2), "timeout")
	
	Show("title")
	GameMaster.start_sound = self.get_node("title/sound")
	GameMaster.Playstart_sound()
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

		


func _on_Settings_pressed():
	self.get_node("title/btnSettings/btnSettingsPressed").visible = true
	yield(get_tree().create_timer(0.2), "timeout")
	self.get_node("title/btnSettings/btnSettingsPressed").visible = false
	self.get_node("Settings").visible = true


func _on_SettingsClose_pressed():
	self.get_node("Settings/btnBack/btnBackPressed").visible = true
	yield(get_tree().create_timer(0.2), "timeout")
	self.get_node("Settings/btnBack/btnBackPressed").visible = false
	self.get_node("Settings").visible = false
	flag=0


func _on_Login_pressed():
	self.get_node("Settings/Form/btnLogin/btnLoginPressed").visible = true
	yield(get_tree().create_timer(0.2), "timeout")
	self.get_node("Settings/Form/btnLogin/btnLoginPressed").visible = false
	var url = GameMaster.server + "/accounts?"+self.get_node("Settings/Form/mailfield").text
	$Settings/Form/loginRequest.request(url)


func _on_user_info_completed(result, response_code, headers, body):
	if(response_code == 200):
		var json = JSON.parse(body.get_string_from_utf8())

		if json == null:
			self.get_node("Settings/Form/ResponseMessage").text = body.get_string_from_utf8()
		else:
			GameMaster.LoadUser(json)
			get_tree().change_scene("res://Loading/Load.tscn")

func _on_Signin_pressed():
	self.get_node("Settings/Form/btnSignin/btnSigninPressed").visible = true
	yield(get_tree().create_timer(0.2), "timeout")
	self.get_node("Settings/Form/btnSignin/btnSigninPressed").visible = false
	
	print(self.get_node("Settings/Form/mailfield").text)
	print(self.get_node("Settings/Form/passwordfield").text)
