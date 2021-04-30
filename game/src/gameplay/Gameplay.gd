extends Node

func _ready() -> void:
	$TimerMenu.wait_time = 1
	$HUD.visible = true
	$Ball.visible = true
	$Rede.visible = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_q"):
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://src/scenes/Menu.tscn")

# warning-ignore:unused_argument
func _physics_process(delta: float) -> void:
	$HUD/LabelShowFPS.text = "FPS: " + str(Performance.get_monitor(Performance.TIME_FPS))
	
	$HUD/Score1.text = str(Global.score_rqt_left)
	$HUD/Score2.text = str(Global.score_rqt_right)
	
	if Global.score_rqt_left == Global.SCORE_MAX:
		$HUD.visible = false
		$Ball.visible = false
		$Rede.visible = false
		$LabelWinner.visible = true
		$LabelWinner.text = "Player 1, Winner!"
		$TimerMenu.start()
	
	if Global.score_rqt_right == Global.SCORE_MAX:
		$HUD.visible = false
		$Ball.visible = false
		$Rede.visible = false
		$LabelWinner.visible = true
		$LabelWinner.text = "Player 2, Winner!"
		$TimerMenu.start()

func _on_TimerMenu_timeout() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://src/scenes/Menu.tscn")
