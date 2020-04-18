extends Node

var size = Vector2(ProjectSettings.get_setting("display/window/size/width"), ProjectSettings.get_setting("display/window/size/height"))
const shoe = preload("res://Shoe.tscn")

func _ready():
	randomize()

func spawn():
		var enemy = shoe.instance()
		var pos = Vector2()
		pos.x = rand_range(0, size.x)
		pos.y = rand_range(0, size.y)
		enemy.position = pos
		add_child(enemy)
		
func _on_Timer_timeout():
	spawn()
	$Timer.start(1)
