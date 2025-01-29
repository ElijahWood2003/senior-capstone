/// @description Dashing
prep = false;
is_dashing = true;
pd = point_direction(x, y, obj_player.x, obj_player.y);
distance = min(MAX_JUMP_DIST, sqrt(sqr(obj_player.x - x) + sqr(obj_player.y - y)));
direction = pd + dcos(pd) * JUMP_ANGLE;
speed = JUMP_SPEED;
startposx = x;
startposy = y;

