/// @description Initialization
wave = 0;
is_creating = false;
img_alpha = 0.01;
IMG_SPEED = 0.01;
amount_spawned = 0;

enemy_info[0][0] = 0;

enemy_sprite_list = ds_list_create();
ds_list_add(enemy_sprite_list, spr_fire_enemy, spr_cloud_enemy, spr_water_enemy, spr_tornado_enemy);

enemy_object_list = ds_list_create();
ds_list_add(enemy_object_list, obj_fire_enemy, obj_cloud_enemy, obj_water_enemy, obj_tornado_enemy);