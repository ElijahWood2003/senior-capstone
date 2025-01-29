/// @description Moving towards player / Animations
	// Moving towards the player
	
	// Animation
	if(obj_player.x > x){
		dir = 1;
	}
	else {
		dir = -1;
	}
	
	if(dir = -1 && !is_dead){
		if(prep){
			image_index = 1;
		}
		else if(is_dashing && alarm[1] < 0){
			image_index = 2;
		}
		else {
			image_index = 0;
		}
	}
	else if!(is_dead){
		if(prep){
			image_index = 7;
		}
		else if(is_dashing && alarm[1] < 0){
			image_index = 8;
		}
		else {
			image_index = 6;
		}
	}
	
	// Deaccelerating
	if(is_dashing && speed > 0){
		speed -= DECEL;
	}
	else if(speed < 0){
		is_dashing = false;
		speed = 0;
		alarm[1] = irandom_range(MIN_TIME, MAX_TIME);
	}
	
	// Colliding with player
	if(collision_rectangle(x, y + 12, x + HITBOX_X, y + HITBOX_Y - 12, obj_player, false, true)){
		is_hit = true;										// a brief moment where you cannot move at all
		alarm[0] = 120;
 
	}
 
 if(is_hit && speed > 0){
	speed -= 3/10;
 }

if(alarm[0] = 119){
	direction += 180;
}
		
	
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
		dead_inst.spr = spr_cloud_enemy;
		dead_inst.sub_img = 6 + dir*3;
		dead_inst.sub_imgm = 8 + dir*3;
		audio_play_sound(snd_enemydeath, 0, false);
		instance_destroy();
	}
	
	// Cleanup
	if(speed = 0 && alarm[1] < 0 && alarm[2] < 0){
		alarm[1] = irandom_range(MIN_TIME, MAX_TIME);
	}