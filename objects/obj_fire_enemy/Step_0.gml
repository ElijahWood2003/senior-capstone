/// @description Movement/Animations
// Moving towards the player\
	var PLAYER_DISTANCE = 150;
	if(is_walking && !collision_circle(x, y, PLAYER_DISTANCE, obj_player, false, true)){
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
		image_index = frame;
	}
	else if(is_walking) {
		image_index = frame + 5;
	}
	
	// Changing Frame
	ANIMATION_TIMER = 60;
	if(is_walking && alarm[0] < 0){
		alarm[0] = ANIMATION_TIMER;
	}
	else if(!is_walking){
		image_index = frame + ((dir + 1)/2) * 5;
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
		dead_inst.spr = spr_fire_enemy;
		dead_inst.sub_img = 5 + dir*3;
		dead_inst.sub_imgm = 7 + dir*3;
		audio_play_sound(snd_enemydeath, 0, false);
		instance_destroy();
	}
