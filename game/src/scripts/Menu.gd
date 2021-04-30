extends Control

func _ready() -> void:
	Global.score_rqt_left = 0
	Global.score_rqt_right = 0

func _input(event: InputEvent) -> void:
	if event.is_action("ui_e"):
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://src/gameplay/Gameplay.tscn")
	
	if event.is_action_pressed("ui_q"):
		get_tree().quit()

func _on_BtnStart_pressed() -> void:
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://src/gameplay/Gameplay.tscn")

func _on_BtnQuit_pressed() -> void:
	get_tree().quit()
