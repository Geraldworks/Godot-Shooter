class_name Shotgun extends SpreadGun

func _shoot():
	reduce_ammunition(ammo_per_shot)
	
	var shot_direction = compute_shooting_direction()
	var shot_directions = determine_spread(shot_direction)
	
	var bullets = []
	for i in range(ammo_per_shot):
		var bullet_instance: Bullet = bullet.instantiate()
		bullet_instance.set_direction(shot_directions[i])
		bullet_instance.set_initial_position(gun_user.global_position)
		bullets.append(bullet_instance)
		
	for bullet in bullets:
		get_tree().current_scene.add_child(bullet)
