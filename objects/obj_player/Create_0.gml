/// Setting Variables
HITBOX_X = 34;
HITBOX_Y = 24;
can_shoot = true;
hitpoints = 4;
is_walking = false;
is_invulnerable = false			// Invulnerable for short duration after being hit
inv_cos = 0;					// Variable to hold the cos wave for invulnerability image_alpha
is_hit = false					// The split second after you have been hit and cannot move
dir = -1;						// Direction for drawing left or right
HSPD = 5;
VSPD = 5;
is_dead = false;

INVULNERABLE_TIME = 95 / (0.5 + global.game_difficulty / 2);

// Death
sub_img = 25;
sub_imgm = 27;
DEATH_TIMEFRAME = 25;