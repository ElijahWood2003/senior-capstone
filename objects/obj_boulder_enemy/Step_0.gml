/// @description Moving towards player / Animations
	// Moving towards the player
	
	// Animation
	if(obj_player.x > x){
		dir = 1;
	}
	else {
		dir = -1;
	}
	
	if(dir = -1){
		if(alarm[0] >= 40 || alarm[0] < 0){
			image_index = 0;
		}
		else if(alarm[0] >= 20){
			image_index = 1;
		}
		else {
			image_index = 2;
		}
	}
	else{
		if(alarm[0] >= 40 || alarm[0] < 0){
			image_index = 6;
		}
		else if(alarm[0] >= 20){
			image_index = 7;
		}
		else {
			image_index = 8;
		}
	}
	
	// Changing angle while jumping
	if(is_dashing){
		var num = direction - pd + 2*dcos(pd)*JUMP_ANGLE;
		var num3 = dcos(pd);
		var boolean = sign(num) == -sign(num3);
		
		if(boolean){
			if(alarm[0] < 0){
				alarm[0] = JUMP_TIME;
				speed = 0;
				is_dashing = false;
			}
		}
		else {
		
			direction -= dcos(pd) * 2*(JUMP_ANGLE/(distance/speed));
		}
	}
	
	
	// Deaccelerating
	
	

	
	// Colliding with arrow
	if(collision_rectangle(x, y + 12, x + HITBOX_X, y + HITBOX_Y, obj_arrow, true, true)){
		instance_destroy(collision_rectangle(x, y + 12, x + HITBOX_X, y + 12 + HITBOX_Y, obj_arrow, true, true));
		audio_play_sound(snd_arrowhit, 0, false);
		hitpoints -= 1;
	}
	
	// Dying
	if(hitpoints <= 0){
		is_dead = true;
		dead_inst = instance_create_depth(x, y, 0, obj_deadenemy);
		dead_inst.spr = spr_boulder_enemy;
		dead_inst.sub_img = 6 + dir*3;
		dead_inst.sub_imgm = 8 + dir*3;
		audio_play_sound(snd_enemydeath, 0, false);
		instance_destroy();
	}
	
	// Cleanup
	