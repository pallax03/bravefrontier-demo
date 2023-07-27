extends Control
# Called when the node enters the scene tree for the first time.
func _ready():
	self.get_node("Username").text = GameMaster.username
	self.get_node("Lv").text = GameMaster.level
	self.get_node("RC").text = GameMaster.rc
	self.get_node("ArenaRank").text = GameMaster.arena_rank
	self.get_node("Gems").text = GameMaster.gems
	self.get_node("Zel").text = GameMaster.zel
	self.get_node("Karma").text = GameMaster.karma
	self.get_node("Energy").text = GameMaster.energy	
	self.get_node("EnergyLabel").text = "Energy is full."


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
