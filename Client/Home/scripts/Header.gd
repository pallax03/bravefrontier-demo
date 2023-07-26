extends Control


# Declare member variables here. Examples:



# Called when the node enters the scene tree for the first time.
func _ready():
	self.get_node("Username").text = username
	self.get_node("Lv").text = String(level)
	self.get_node("RC").text = String(rc)
	self.get_node("ArenaRank").text = arena_rank
	self.get_node("Gems").text = String(gems)
	self.get_node("Zel").text = String(zel)
	self.get_node("Karma").text = String(karma)
	self.get_node("Energy").text = String(energy)	
	self.get_node("EnergyLabel").text = "Energy is full."
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
