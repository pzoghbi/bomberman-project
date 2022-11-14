/// @description Insert description here
// You can write your code in this editor


if rotate{
	image_angle = lerp(image_angle, random_rotation, .125);
}

x = (x div TILE_SIZE) * TILE_SIZE + TILE_SIZE/2;	
y = (y div TILE_SIZE) * TILE_SIZE + TILE_SIZE/2;

if animation_hit_frame(image_number - 1){
	instance_destroy();
}