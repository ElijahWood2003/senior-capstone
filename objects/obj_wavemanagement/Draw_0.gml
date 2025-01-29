/// @description Drawing Health/Spawning Enemies

// Drawing health + wave number
if(room != rm_death){
	var hx = 4;
	var hy = 4;
	var ext = .75;
	draw_sprite_ext(spr_heart, max(-obj_player.hitpoints + 2, 0), hx, hy, ext, ext, 0, c_white, 1);
	draw_sprite_ext(spr_heart, min(-obj_player.hitpoints + 4, 2), hx + 32, hy, ext, ext, 0, c_white, 1);

	var str = "Wave: " + string(wave);
	 col = c_white;
	draw_set_font(fnt_waves);
	draw_text_color(90, 4, str, col, col, col, col, 1)
	
	
	// Drawing spawning enemies/circles
	if(is_creating){
		var ELL_CONST = 25;
		for(var e = 0; e < amount_spawned; e += 1){
			spr = ds_list_find_value(enemy_sprite_list, enemy_info[e][2]);
			draw_ellipse_colour(enemy_info[e][0] - ELL_CONST, enemy_info[e][1] - ELL_CONST + 6, enemy_info[e][0] + sprite_get_width(spr) + ELL_CONST, enemy_info[e][1] + sprite_get_height(spr) + ELL_CONST - 6, c_red, c_red, true);
			draw_sprite_ext(spr, 0, enemy_info[e][0], enemy_info[e][1], 1, 1, 0, c_white, img_alpha);
	
		}
	}
}
else {
	var str = "You survived " + string(wave) + " round(s). Press 'R' to restart.";
	draw_text(room_width / 2 - 200, room_height/2, str)
}