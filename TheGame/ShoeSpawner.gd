extends Node

var size = Vector2(ProjectSettings.get_setting("display/window/size/width"), ProjectSettings.get_setting("display/window/size/height"))
const shoe = preload("res://Shoe.tscn")
const offset = 120

func _ready():
	randomize()

func spawn():
		var enemy = shoe.instance()
		enemy.connect("ant_squashed", $"..", "_on_ant_squashed")
		var pos = Vector2()
		var ant_pos = $"../Ant".position
		var offset_x = rand_range(0, offset)	
		var offset_y = rand_range(0, offset)		
		pos.x = ant_pos.x + offset_x
		pos.y = ant_pos.y + offset_y
		enemy.position = pos
		add_child(enemy)
		$"..".increment_score()
				
func _on_Timer_timeout():
	spawn()
