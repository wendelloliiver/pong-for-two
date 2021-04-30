extends GlobalConfig

func _ready() -> void:
	$TimerMenu.wait_time = 3
	$HUD.visible = true
	$Ball.visible = true
	$Rede.visible = true

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
	
	match current_state:
		GAME_STATE.MENU:
			if Input.is_key_pressed(KEY_SPACE):
				current_state = GAME_STATE.SERVER
		
		GAME_STATE.SERVER:
			if SCORE_MAX == score_rqt_left:
				current_state = GAME_STATE.MENU
				
				score_rqt_left  = 0
				score_rqt_right = 0
			
			if SCORE_MAX == score_rqt_right:
				current_state = GAME_STATE.MENU
				
				score_rqt_left  = 0
				score_rqt_right = 0
			
			if Input.is_key_pressed(KEY_SPACE):
				current_state = GAME_STATE.PLAY
		
		GAME_STATE.PLAY:
			pass

func _on_TimerMenu_timeout() -> void:
	get_tree().change_scene("res://src/scenes/Menu.tscn")
