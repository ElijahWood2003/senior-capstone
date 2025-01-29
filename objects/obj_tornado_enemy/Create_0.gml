/// @description Initialization
hitpoints = 2 * (1 + global.game_difficulty / 3);
is_hit = false;
is_dead = false;
ACCEL = 0.1;
speed = 1;
TOP_SPEED = 3 + global.game_difficulty;
HITBOX_X = sprite_width;
HITBOX_Y = sprite_height - 12;