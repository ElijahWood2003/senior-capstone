/// @description Adding size
if(pmultx < MAX_SIZEX && alarm[0] > 0){
	pmultx += 1;
	pmulty += 83/120;
}
else if(alarm[0] < 0 && pmultx > 0){
	pmultx -= 1;
	pmulty -= 83/120;
}
else if(pmultx <= 0){
	instance_destroy();
}

inst = collision_rectangle(x - pmultx/2, y - pmulty/2, x + pmultx/2, y + pmulty/2 - 12, obj_player, true, true);
if(inst != noone && !obj_player.is_invulnerable){
	audio_play_sound(snd_heartbeat, 100, false);
	obj_player.hitpoints -= 1;

	obj_player.is_invulnerable = true;								// invulnerability after being hit
	obj_player.is_hit = true;										// a brief moment where you cannot move at all
	obj_player.direction = point_direction(x, y, obj_player.x, obj_player.y);
	obj_player.speed = 6;

	obj_player.alarm[1] = obj_player.INVULNERABLE_TIME;
	obj_player.alarm[2] = 20;
}