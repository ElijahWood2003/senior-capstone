/// @description Initialization
hitpoints = 5 * (1 + global.game_difficulty / 2);
is_dead = false;
ACCEL = 0.01;
JUMP_SPEED = 3 + global.game_difficulty*2;
HITBOX_X = sprite_width;
HITBOX_Y = sprite_height - 12;

is_dashing = false;
JUMP_ANGLE = 15;
MAX_JUMP_DIST = 150;
JUMP_TIME = 100;
alarm[0] = JUMP_TIME;