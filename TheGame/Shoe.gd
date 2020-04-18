extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$ShoeSprite.visible = false
	$Area2D/Detection.disabled = true
	$Collision.disabled = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var val = $DownTimer.wait_time - $DownTimer.time_left
	$Shadow.set_scale(Vector2(val,val))



func _on_Timer_timeout():
	$ShoeSprite.visible = true
	check_collision()
	$Collision.disabled = false

func check_collision():
	$Area2D/Detection.disabled = false

func _on_WaitTimer_timeout():
	pass # Replace with function body.


func _on_WaitTimer2_timeout():
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if(body.get_name() == "Ant"):
		print(body.get_name())
