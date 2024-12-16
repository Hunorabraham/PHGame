extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	move_and_slide()
	if(is_on_wall()):
		print_debug(get_slide_collision_count())
		for i in get_slide_collision_count():
			var collision = get_slide_collision(i)
			var tilemap = instance_from_id(collision.get_collider().get_instance_id());
			var coords = tilemap.local_to_map(get_parent().position);
			print_debug("Collided with: ", coords)
