extends Area2D

var score_p1 := 0
var score_p2 := 0

var speed := 250
var velocity = Vector2.LEFT

func _process(delta: float) -> void:
	position += velocity * speed * delta
	
	check_collision_test()
	check_for_scores()

func _initial_position() -> void:
	position = Vector2(360 / 2, 240 / 2)
	velocity = Vector2.ZERO
	
	$Timer.start()

func check_collision_test() -> void:
	if position.y <= 0 or position.y >= 240:
		velocity.y *= -1

func check_for_scores() -> void:
	if position.x < -10:
		_initial_position()
		Global.is_left = false
		Global.score_rqt_right += 1

	elif position.x > 370:
		_initial_position()
		Global.is_left = true
		Global.score_rqt_left += 1

func hit_factor(ball: Vector2, racket: Vector2, size_racket: float) -> float:
	return (ball.y - racket.y) / size_racket

func _on_ball_area_entered(area: Area2D) -> void:
	velocity.y = hit_factor(self.position, area.position, 32)
	velocity.x *= -1

func _on_Timer_timeout() -> void:
	velocity = Vector2.LEFT if Global.is_left else Vector2.RIGHT
