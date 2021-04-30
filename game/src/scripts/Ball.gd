extends Area2D

var score_p1 := 0
var score_p2 := 0

var speed := 150
var velocity = Global.ball_direction

func _process(delta: float) -> void:
	position += velocity * speed * delta
	check_collision_test()
	check_for_scores()

func _initial_position() -> void:
	position = Vector2(360 / 2, 240 / 2)

func check_collision_test() -> void:
	if position.y <= 0 or position.y >= 240:
		velocity.y *= -1

func check_for_scores() -> void:
	if position.x < 0:
		_initial_position()
		
		Global.current_state = Global.GAME_STATE.SERVER
		Global.score_rqt_right += 1

	elif position.x > 360:
		_initial_position()
		
		Global.current_state = Global.GAME_STATE.SERVER
		Global.score_rqt_left += 1

func hit_factor(ball: Vector2, racket: Vector2, size_racket: float) -> float:
	return (ball.y - racket.y) / size_racket

func _on_ball_area_entered(area: Area2D) -> void:
	velocity.y = hit_factor(self.position, area.position, 32)
	velocity.x *= -1

func _on_Timer_timeout() -> void:
	pass # Replace with function body.
