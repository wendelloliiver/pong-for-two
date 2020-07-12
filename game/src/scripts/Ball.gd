extends Area2D

var score_p1 := 0
var score_p2 := 0

var speed := 150
var velocity := Vector2.LEFT

func _physics_process(delta: float) -> void:
	position += velocity * speed * delta
	check_collision_test()
	check_for_scores()

func check_collision_test() -> void:
	if position.y <= 0 or position.y >= 240:
		velocity.y *= -1

func check_for_scores() -> void:
	if position.x < 0:
		score_p2 += 1
		position = Vector2(360 / 2, 240 / 2)
	elif position.x > 360:
		score_p1 += 1
		position = Vector2(360 / 2, 240 / 2)

func hit_factor(ball: Vector2, racket: Vector2, size_racket: float) -> float:
	return (ball.y - racket.y) / size_racket

func _on_ball_area_entered(area: Area2D) -> void:
	velocity.y = hit_factor(self.position, area.position, 32)
	velocity.x *= -1
