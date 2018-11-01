extends RigidBody2D

var current_ball_speed_x = 0
var ball_speed_y = 150
var direction = 1
const ball_speed_x = 150

func _physics_process(delta):
	var movement = Vector2(
		delta * current_ball_speed_x, 
		delta * ball_speed_y * direction
	)
	var result = Physics2DTestMotionResult.new()
	if self.test_motion(movement, 0.0, result):
		direction = direction * -1
		movement = result.collision_normal.reflect(movement) 
		if result.collision_normal.x != 0:
			current_ball_speed_x = current_ball_speed_x * -1
	self.translate(movement)

func _unhandled_key_input(event):
	if event.pressed:
		if event.scancode == KEY_LEFT:
			current_ball_speed_x = ball_speed_x * -1
		elif event.scancode == KEY_RIGHT:
			current_ball_speed_x = ball_speed_x
	else:
		current_ball_speed_x = 0
		
	
	