extends Control


var delta_time = 0.2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func hometriggered():
	self.get_node("Home/HomePressed").visible = true
	yield(get_tree().create_timer(delta_time), "timeout")
	self.get_node("Home/HomePressed").visible = false
	pass # Replace with function body.


func unittriggered():
	self.get_node("Unit/UnitPressed").visible = true
	yield(get_tree().create_timer(delta_time), "timeout")
	self.get_node("Unit/UnitPressed").visible = false
	pass # Replace with function body.


func towntriggered():
	self.get_node("Town/TownPressed").visible = true
	yield(get_tree().create_timer(delta_time), "timeout")
	self.get_node("Town/TownPressed").visible = false
	pass # Replace with function body.


func shoptriggered():
	self.get_node("Shop/ShopPressed").visible = true
	yield(get_tree().create_timer(delta_time), "timeout")
	self.get_node("Shop/ShopPressed").visible = false
	pass # Replace with function body.


func summontriggered():
	self.get_node("Summon/SummonPressed").visible = true
	yield(get_tree().create_timer(delta_time), "timeout")
	self.get_node("Summon/SummonPressed").visible = false
	pass # Replace with function body.


func socialtriggered():
	self.get_node("Social/SocialPressed").visible = true
	yield(get_tree().create_timer(delta_time), "timeout")
	self.get_node("Social/SocialPressed").visible = false
	pass # Replace with function body.
