/// @description Creating/Managing Waves
if(!instance_exists(obj_enemyparent) && !is_creating && room != rm_death){
	is_creating = true;
	wave += 1;
	if(wave mod 5 = 0){
		global.game_difficulty += 1;
	}
	
	// Creating random enemies
	amount_spawned = ceil(wave/2)
	for(var e = 0; e < amount_spawned; e += 1){
		enemy_info[e][0] = round(random_range(60, room_width - 60));						// x coord
		enemy_info[e][1] = round(random_range(60, room_height - 60));						// y coord
		enemy_info[e][2] = irandom(ds_list_size(enemy_object_list) - 1);	// enemy type
	}
}

if(is_creating && room != rm_death){
	img_alpha += IMG_SPEED;
}

if(img_alpha = 1 && room != rm_death){
	is_creating = false;
	for(var e = 0; e < amount_spawned; e += 1){
		instance_create_depth(enemy_info[e][0], enemy_info[e][1], 0, ds_list_find_value(enemy_object_list, enemy_info[e][2]));
	}
	img_alpha = 0;
	
}