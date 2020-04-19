extends StaticBody2D


signal ant_squashed

# Called when the node enters the scene tree for the first time.
func _ready():
	$ShoeSprite.visible = false
	$Area2D/Detection.disabled = true
	$Collision.disabled = true
	var tween = get_node("Tween")
	$Shadow.set_scale(Vector2(0,0))
	tween.interpolate_property($Shadow, "scale",Vector2(0, 0), Vector2(1, 1), $DownTimer.wait_time)
	tween.start()
	
func check_collision():
	$Area2D/Detection.disabled = false

func _on_Timer_timeout():
	$SoundFX.play()
	$ShoeSprite.visible = true
	check_collision()
	$Collision.disabled = false
	$WaitTimer.start()

func _on_WaitTimer_timeout():
	$UpTimer.start()
	$Collision.disabled = true
	var tween = get_node("TweenUP")
	tween.interpolate_property(self, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), $UpTimer.wait_time)
	tween.start()

func _on_Area2D_body_entered(body):
	if(body.get_name() == "Ant"):
		emit_signal("ant_squashed")

func _on_UpTimer_timeout():
	queue_free()
