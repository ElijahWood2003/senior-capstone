/// Movement
var press_key = keyboard_check(ord("A")) || keyboard_check(ord("D")) || keyboard_check(ord("S")) || keyboard_check(ord("W"));
if(keyboard_check(ord("A")) and !place_meeting(x - 5, y, obj_solid) && !is_hit && !is_dead){
		is_walking = true;
		x -= HSPD;
}

if(keyboard_check(ord("D")) and !place_meeting(x + 5, y, obj_solid) && !is_hit && !is_dead){
		is_walking = true;
		x += HSPD;
}

if(keyboard_check(ord("W")) and !place_meeting(x, y - 5, obj_solid) && !is_hit && !is_dead){
		is_walking = true;
		y -= VSPD;
}

if(keyboard_check(ord("S")) and !place_meeting(x, y + 5, obj_solid) && !is_hit && !is_dead){
		is_walking = true;
		y += VSPD;
}

if!(press_key){
		is_walking = false;
}


/// Animation
if(mouse_x > x + 17 && !is_dead){
	dir = 1;
}
else{
	dir = -1;
}

if(is_walking && !is_dead){
	if(dir = 1){
		if(image_index >= 24){
			image_index = 0;
		}
		else {
			image_index += 1;
		}
	}
	else {
		if(image_index >= 50 || image_index < 28){
			image_index = 29;
		}
		else {
			image_index += 1;
		}
	}
}
else if (!is_dead) {
	image_index = 14 - 14*dir;
}
else {
	image_index = sub_img;
}


if(is_invulnerable && !is_dead){
	image_alpha = abs(dcos(inv_cos));
	inv_cos += 10;
}
else {
	image_alpha = 1;
	inv_cos = 0;
}

 // Shooting
 var SHOT_TIMER = 30;
 if(mouse_check_button(mb_left) && !is_dead){
	if(can_shoot){
		var arrow = instance_create_depth(x + sign(dir + 1)*34, y + 20, -16000, obj_arrow);
		var pd = point_direction(x + sign(dir + 1)*34, y + 20, mouse_x, mouse_y);
		arrow.image_angle = pd + 90;
		audio_play_sound(snd_arrowshot, 0, false)
		can_shoot = false;
		alarm[0] = SHOT_TIMER;
	}
 }
 
 // Being Hit
 
 if(collision_rectangle(x, y + 12, x + HITBOX_X, y + HITBOX_Y + 6, obj_enemyparent, true, true) && !is_invulnerable && !is_dead){
	audio_play_sound(snd_heartbeat, 100, false);
	hitpoints -= 1;

	enemy_inst = collision_rectangle(x, y + 12, x + HITBOX_X, y + HITBOX_Y + 6, obj_enemyparent, true, true);
	enemy_dir = enemy_inst.direction;
	is_invulnerable = true;								// invulnerability after being hit
	is_hit = true;										// a brief moment where you cannot move at all
	direction = enemy_dir;
	speed = max(enemy_inst.speed, 6);

	alarm[1] = INVULNERABLE_TIME;
	alarm[2] = 20;
	
	if(enemy_inst.object_index = obj_mini_fire_enemy){
		audio_play_sound(snd_enemydeath, 0, false);
		instance_destroy(enemy_inst);
	}
 
 }
 
 if(is_hit && !is_dead){
	if(place_meeting(x, y, obj_solid)){
		direction += 180;
	}
	speed -= 3/10;
 }
 
 if(hitpoints <= 0){
	 if(alarm[3] < 0 && sub_img = 25){
		 is_dead = true;
		 sub_img = 38 - dir*13;
		 sub_imgm = 40 - dir*13;
		 alarm[3] = DEATH_TIMEFRAME;
		 audio_play_sound(snd_playerdeath, 100, false);
	 }
	 if(sub_img = sub_imgm + 1){
		room_goto_next();
	 }
}