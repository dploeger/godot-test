extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var first_sprite = $FirstSprite
	var second_sprite = $SecondSprite
	var collider = Physics2DTestMotionResult.new()
	var movement = Vector2(64,0)
	var is_colliding = first_sprite.test_motion(movement, 0.0, collider)
	
	print(first_sprite.position)
	print(movement)
	
	if is_colliding:
		print(collider)
	else:
		print("NOT COLLIDING")
		
	var parameter = Physics2DShapeQueryParameters.new()
	parameter.set_shape($FirstSprite/CollisionShape2D.shape)
	parameter.transform = $SecondSprite.transform
	var space = get_world_2d().get_space()
	var space_state = Physics2DServer.space_get_direct_state(space)

	var results = space_state.intersect_shape(parameter)
	
	if len(results) > 0:
		print (results)
	else:
		print("NOT COLLIDING, TOO!")
		
	first_sprite.translate(movement)

func _input(event):
	if event.is_class("InputEventMouseButton") and event.pressed:
		var first_sprite = $FirstSprite
		var second_sprite = $SecondSprite
		var collider = Physics2DTestMotionResult.new()
		var movement = event.position - first_sprite.position
		var is_colliding = first_sprite.test_motion(movement, 0.0, collider)
		
		print(movement)
		
		if is_colliding:
			print(collider)
		else:
			print("NOT COLLIDING")
		first_sprite.translate(movement)
	