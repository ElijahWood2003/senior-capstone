/// @description Movement/Animations
// Moving towards the player
	if(is_walking && !collision_circle(x, y, 150, obj_player, false, true)){
		pd = point_direction(x, y, obj_player.x, obj_player.y);
		direction = pd;
		speed = min(speed + ACCEL, TOP_SPEED);
	}
	else {
		speed = 0;
	}
	
	// Animation
	if(obj_player.x > x){
		dir = 1;
	}
	else {
		dir = -1;
	}
	
	if(dir = -1 && is_walking){
		image_index = 0;
	}
	else if(is_walking) {
		image_index = 5;
	}
	
	// Changing Frame
	if(!is_walking){
		image_index = 1 + ((dir + 1)/2) * 5;
	}
	
 
	// Colliding with arrow
	if(collision_rectangle(x, y + 12, x + HITBOX_X, y + HITBOX_Y + 12, obj_arrow, true, true)){
		instance_destroy(collision_rectangle(x, y + 12, x + HITBOX_X, y + 12 + HITBOX_Y, obj_arrow, true, true));
		audio_play_sound(snd_arrowhit, 0, false);
		hitpoints -= 1;
	}
	
	// Dying
	if(hitpoints <= 0){
		dead_inst = instance_create_depth(x, y, 0, obj_deadenemy);
		dead_inst.spr = spr_water_enemy;
		dead_inst.sub_img = 5 + dir*3;
		dead_inst.sub_imgm = 7 + dir*3;
		audio_play_sound(snd_enemydeath, 0, false);
		instance_destroy();
	}
