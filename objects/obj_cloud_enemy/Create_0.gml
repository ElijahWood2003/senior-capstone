/// @description Initialization
hitpoints = 5 * (1 + global.game_difficulty / 2);
is_hit = false;
is_dead = false;
DECEL = 0.4;
TOP_SPEED = 13 + global.game_difficulty;
HITBOX_X = sprite_width;
HITBOX_Y = sprite_height - 12;

prep = false;
is_dashing = false;
MIN_TIME = 100;
MAX_TIME = 125;
alarm[1] = irandom_range(MIN_TIME, MAX_TIME);