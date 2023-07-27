extends Node
var id_client = null
var server = "http://localhost:8080"

var start_sound

#user info
var username = "Pallax"
var level = 9999999999
var levelbar = 500
var rc = "--"
var energy= 9999999999
var arena_rank = "Newbie"
var gems  = 9999999999
var zel   = 9999999999
var karma = 9999999999
var arena_orbs = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func Playstart_sound():
	start_sound.play(0.0)
	
func Stopstart_sound():
	start_sound.stop()

func LoadUser(json):
	id_client = json.result["_id"]
	username = json.result["display_name"]
	level = json.result["level"]
	energy = json.result["energy"]
	gems  = json.result["gems"]
	zel   = json.result["zel"]
	karma = json.result["karma"]
	arena_orbs = json.result["arena_orbs"]
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
