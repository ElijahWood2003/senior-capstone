/// @description
direction = pd;
speed = 7;
image_angle = pd + 90;

if(x < -16 || y < -16 || x > room_width + 16 || y > room_height + 16){
	instance_destroy();
}