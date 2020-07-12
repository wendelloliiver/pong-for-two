extends Area2D

func _physics_process(delta: float) -> void:
	if position.y > 0 + 16:
		if Input.is_action_pressed("p1_move_up"):
			position.y -= 100 * delta
	if position.y < 240 - 16:
		if Input.is_action_pressed("p1_move_down"):
			position.y += 100 * delta
