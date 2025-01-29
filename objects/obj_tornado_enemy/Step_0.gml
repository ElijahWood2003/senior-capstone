/// @description Moving towards player / Animations
	// Moving towards the player
	if!(is_hit){
		pd = point_direction(x, y, obj_player.x, obj_player.y);
		direction = pd;
		speed = min(speed + ACCEL, TOP_SPEED);
	
	}
	
	// Animation
	if(obj_player.x > x){
		dir = 1;
	}
	else {
		dir = -1;
	}
	
	if(dir = -1 && !is_dead){
		if(image_index >= 2){
			image_index = 0;
		}
		else {
			image_index += 1;
		}
	}
	else if!(is_dead){
		if(image_index = 8 || image_index < 6){
			image_index = 6;
		}
		else {
			image_index += 1;
		}
	}
	
	// Colliding with player
	if(collision_rectangle(x, y + 12, x + HITBOX_X, y + HITBOX_Y - 12, obj_player, false, true)){
		is_hit = true;										// a brief moment where you cannot move at all
		alarm[0] = 120;
 
 }
 
 if(is_hit && speed > 0){
	speed -= 3/10;
 }
 
if(alarm[0] = 118){
	direction += 180;
}
		
	
	
	// Colliding with arrow
	if(collision_rectangle(x, y + 12, x + HITBOX_X, y + HITBOX_Y + 12, obj_arrow, true, true)){
		instance_destroy(collision_rectangle(x, y + 12, x + HITBOX_X, y + 12 + HITBOX_Y, obj_arrow, true, true));
		audio_play_sound(snd_arrowhit, 0, false);
		hitpoints -= 1;
	}
	
	// Dying
	if(hitpoints <= 0){
		is_dead = true;
		dead_inst = instance_create_depth(x, y, 0, obj_deadenemy);
		dead_inst.spr = spr_tornado_enemy;
		dead_inst.sub_img = 6 + dir*3;
		dead_inst.sub_imgm = 8 + dir*3;
		audio_play_sound(snd_enemydeath, 0, false);
		instance_destroy();
	}