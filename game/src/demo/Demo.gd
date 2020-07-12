extends Node

func _ready() -> void:
	$TimerMenu.wait_time = 5
	$HUD.visible = true
	$Ball.visible = true
	$Rede.visible = true

# warning-ignore:unused_argument
func _process(delta: float) -> void:
	$HUD/LabelShowFPS.text = "FPS: " + str(Performance.get_monitor(Performance.TIME_FPS))
	
	$HUD/Score1.text = str($Ball.score_p1)
	$HUD/Score2.text = str($Ball.score_p2)
	
	if $Ball.score_p1 == 10:
		$HUD.visible = false
		$Ball.visible = false
		$Rede.visible = false
		$LabelWinner.visible = true
		$LabelWinner.text = "Player 1, Winner!"
		$TimerMenu.start()
	elif $Ball.score_p2 == 10:
		$HUD.visible = false
		$Ball.visible = false
		$Rede.visible = false
		$LabelWinner.visible = true
		$LabelWinner.text = "Player 2, Winner!"
		$TimerMenu.start()

func _on_TimerMenu_timeout() -> void:
	get_tree().change_scene("res://src/scenes/Menu.tscn")
