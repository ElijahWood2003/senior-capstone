/// @description Initialization
hitpoints = 0.5 * (1 + global.game_difficulty / 2);
is_hit = false;
is_dead = false;
ACCEL = 0.1;
speed = 3;
TOP_SPEED = 5 + global.game_difficulty;
HITBOX_X = sprite_width;
HITBOX_Y = sprite_height - 12;
