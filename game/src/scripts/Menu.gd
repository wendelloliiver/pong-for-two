extends Control

func _on_BtnStart_pressed() -> void:
	get_tree().change_scene("res://src/gameplay/Gameplay.tscn")

func _on_BtnQuit_pressed() -> void:
	get_tree().quit()
