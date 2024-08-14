class_name SpreadGun extends Gun

@export var angle_spread: float = 60.0

func determine_spread(direction_of_shoot: Vector2) -> Array[Vector2]:
	var directions: Array[Vector2] = []
	var angle_step = angle_spread / (ammo_per_shot - 1)
	for i in range(ammo_per_shot):
		var angle = -angle_spread / 2 + i * angle_step
		var rad = deg_to_rad(angle)
		var rotated_direction = direction_of_shoot.rotated(rad)
		directions.append(rotated_direction)
		
	return directions
	
