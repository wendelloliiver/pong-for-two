extends Area2D

func _process(delta: float) -> void:
	if position.y > 0 + 16:
		if Input.is_action_pressed("ui_up"):
			position.y -= 100 * delta
	if position.y < 240 - 16:
		if Input.is_action_pressed("ui_down"):
			position.y += 100 * delta
