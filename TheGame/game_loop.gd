extends Node2D

var game_over = false
var score = 0

func _ready():
	$SoundFX.play()
	reset_GUI()
	
func reset_GUI():
	$GUI/Score.text = str(score)
	$GUI/GameOverGUI.visible = false
	
func display_GameOverGUI():
	if score > Global.highscore:
		Global.highscore = score
	$GUI/GameOverGUI/HighscoreValue.text = str(Global.highscore)
	$GUI/GameOverGUI.visible = true
		
func _on_ant_squashed():
	if not game_over:
		$Ant.die()
		$"ShoeSpawner/Timer".stop()
		display_GameOverGUI()
		game_over = true
		
func _input(event):
	if event is InputEventJoypadButton or event.is_action_pressed("game_restart"):
		if game_over:
			get_tree().reload_current_scene()

func increment_score():
	score += 1
	$GUI/Score.text = str(score)
