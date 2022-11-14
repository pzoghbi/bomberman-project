/// @description Insert description here
// You can write your code in this editor

// create explosions around the bomb
// check and destroy walls
// dir in degrees
for (dir = 0; dir < 4; dir++){
	// strength of the bomb (number of tiles to check)
	for(times = 1; times <= strength; times++){
		var xx = x + lengthdir_x(TILE_SIZE * (times), dir*90);
		var yy = y + lengthdir_y(TILE_SIZE * (times), dir*90);
		// check wall instance around the bomb
		var wall_instance_nearby = instance_position(xx, yy, o_wall);
		
		// check solid wall instance around the bomb
		var solid_instance_nearby = instance_position(xx, yy, o_solid);
		
		// check for walls around the explosion
		if !place_meeting(xx, yy, o_solid)
		{
			// create explosion instance
			instance_create_layer(xx,  yy, "Instances", o_explosion);
		}
		
		// destroy walls and drop items
		if wall_instance_nearby //|| solid_instance_nearby 
		{
			with wall_instance_nearby{
				instance_create_layer(x,  y, "Instances", o_explosion);
				destroy = true;
			}
			
			times = strength + 1;
		}
		
	}
}

instance_create_layer(x,  y, "Instances",	o_explosion);
audio_play_sound(a_bomb_explode, 1, false);
instance_destroy();