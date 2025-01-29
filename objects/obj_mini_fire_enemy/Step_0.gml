/// @description Movement
pd = point_direction(x, y, obj_player.x, obj_player.y);
direction = pd;
speed = min(speed + ACCEL, TOP_SPEED);



// Animation
	if(obj_player.x > x){
		dir = 1;
	}
	else {
		dir = -1;
	}
	
	if(dir = -1){
		image_index = 0
	}
	else {
		image_index = 4;
	}
	
	// Colliding with arrow
	if(collision_rectangle(x, y + 12, x + HITBOX_X, y + HITBOX_Y + 12, obj_arrow, true, true)){
		instance_destroy(collision_rectangle(x, y + 12, x + HITBOX_X, y + 12 + HITBOX_Y, obj_arrow, true, true));
		audio_play_sound(snd_arrowhit, 0, false);
		hitpoints -= 1;
	}
	
	if(hitpoints <= 0){
		dead_inst = instance_create_depth(x, y, 0, obj_deadenemy);
		dead_inst.spr = spr_mini_fire_enemy;
		dead_inst.sub_img = 3 + dir*2;
		dead_inst.sub_imgm = 5 + dir*2;
		audio_play_sound(snd_enemydeath, 0, false);
		instance_destroy();
	}
	

	if(place_meeting(x, y, obj_player)){
		with(obj_player){
			audio_play_sound(snd_heartbeat, 100, false);
			hitpoints -= 1;

			is_invulnerable = true;								// invulnerability after being hit
			is_hit = true;										// a brief moment where you cannot move at all

			alarm[1] = INVULNERABLE_TIME;
			alarm[2] = 20;
		}
		instance_destroy();
	}