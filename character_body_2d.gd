extends CharacterBody2D


const SPEED = 3000.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	self.velocity = Vector2.ZERO
	if(Input.is_key_pressed(KEY_A)):
		self.velocity.x -= SPEED*delta
	if(Input.is_key_pressed(KEY_D)):
		self.velocity.x += SPEED*delta
	if(Input.is_key_pressed(KEY_W)):
		self.velocity.y -= SPEED*delta/2
	if(Input.is_key_pressed(KEY_S)):
		self.velocity.y += SPEED*delta/2
	
	var sprite = get_node("Sprite2D")
	#crazy
	if(velocity.x < 0 and velocity.y < 0):
		sprite.frame = 3
	elif(velocity.x < 0 and velocity.y > 0):
		sprite.frame = 1
	elif(velocity.x < 0 and velocity.y == 0):
		sprite.frame = 2
	elif(velocity.x > 0 and velocity.y < 0):
		sprite.frame = 5
	elif(velocity.x > 0 and velocity.y > 0):
		sprite.frame = 7
	elif(velocity.x > 0 and velocity.y == 0):
		sprite.frame = 6
	elif(velocity.x == 0 and velocity.y < 0):
		sprite.frame = 4
	elif(velocity.x == 0 and velocity.y > 0):
		sprite.frame = 0

	move_and_slide()
	if(is_on_wall()):
		for i in get_slide_collision_count():
			var collision = get_slide_collision(i)
			print_debug("Collided with: ", get_node("../MapRoot/Object Layer").local_to_map(collision.get_position()))
