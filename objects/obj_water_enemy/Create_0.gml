/// @description Initializing
hitpoints = 6 * (1 + global.game_difficulty / 2);

ACCEL = 0.1;
speed = 0;
TOP_SPEED = 1 + global.game_difficulty;
is_walking = true;
WALKING_TIME = 200;
CREATION_TIME = 75;
alarm[1] = WALKING_TIME;

HITBOX_X = sprite_width;
HITBOX_Y = sprite_height - 12;
