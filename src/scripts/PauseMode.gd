extends Node

func _ready() -> void:
	$LabelPaused.visible = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_exit"):
		if get_tree().paused == false:
			get_tree().paused = true
			$LabelPaused.visible = true
		else:
			get_tree().paused = false
			$LabelPaused.visible = false
