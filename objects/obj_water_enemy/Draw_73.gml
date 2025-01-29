/// @description Drawing self over puddle
if(dir = -1 && is_walking){
	draw_sprite(spr_water_enemy, 0, x, y);
}
else if(is_walking) {
	draw_sprite(spr_water_enemy, 5, x, y);
}
	
	// Changing Frame
if(!is_walking){
	draw_sprite(spr_water_enemy, 1 + ((dir + 1)/2) * 5, x, y);
}