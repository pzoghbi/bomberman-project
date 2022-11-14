/// @description Insert description here
// You can write your code in this editor
if global.game_state == "play"{	
	var m_speed = move_speed * global.delta_seconds;

	var input_x = input_right - input_left;
	var input_y = input_down - input_up;
	var input_m = point_distance(0, 0, input_x, input_y) > 0;
	var input_direction = point_direction(0, 0, input_x, input_y);
	
	if (input_m) {
		image_xscale = abs(input_x) ? input_x : image_xscale;
	}
	
	h_speed = abs(input_x) * lengthdir_x(m_speed, input_direction);
	v_speed = abs(input_y) * lengthdir_y(m_speed, input_direction);

	// collide horizontally
	if place_meeting(x + h_speed, y + v_speed, o_solid) {
		h_speed = 0;
		v_speed = 0;
		for(var angle = 10; angle <= 80; angle+=10) 
		{
			for(var multiplier = -1; multiplier <= 1; multiplier+=2) 
			{
				var new_angle = input_direction + angle*multiplier;
				var new_hspeed = lengthdir_x(m_speed, new_angle);
				var new_vspeed = lengthdir_y(m_speed, new_angle);
				if !place_meeting(x + new_hspeed, y + new_vspeed, o_solid) 
				{
					h_speed = new_hspeed;
					v_speed = new_vspeed;
				}
			}
		}
	}
	
	// collide with bombs
	if place_meeting(x + h_speed, y, o_bomb)
	{		
		if !place_meeting(x, y, o_bomb) {
			if (can_kick){
				with instance_nearest(x, y, o_bomb){	
					if (!place_meeting(x+sign(other.h_speed)*16, y, o_solid)
					and !place_meeting(x+sign(other.h_speed)*16, y, o_bomb))
					{
						h_speed = sign(other.h_speed) * 2;
					}
				}
			}
			h_speed = 0;
		} 
	}	
	
	// collide with bombs
	if place_meeting(x, y + v_speed, o_bomb)
	{		
		if !place_meeting(x, y, o_bomb) {
			if (can_kick){
				with instance_nearest(x, y, o_bomb){	
					if (!place_meeting(x, y+sign(other.v_speed)*16, o_solid)
					and !place_meeting(x, y+sign(other.v_speed)*16, o_bomb))
					{
						v_speed = sign(other.v_speed) * 2;
					}
				}
			}
			v_speed = 0;
		} 
	}	
	
	x += h_speed;	
	y += v_speed;
	
	// placing bombs
	var can_bomb = bombs < bombs_max;
	if input_bomb{
		if can_bomb{
			var bomb;
			var bomb_x = (x div TILE_SIZE) * TILE_SIZE;
			var bomb_y = (y div TILE_SIZE) * TILE_SIZE;
		
			// place bomb instance
			if !place_meeting(bomb_x, bomb_y, o_bomb){
				audio_play_sound(a_bomb_place, 5, false);
				bombs++;
				
				bomb = instance_create_layer(bomb_x, bomb_y, "Instances", o_bomb);
				bomb.parent = id;
				bomb.alarm[0] = bombs_time;
				bomb.strength = bombs_strength;
				bomb.image_speed = ONE_SEC / bombs_time;
			}
		}
	}
}

/* states */
if is_dead{
	// kill player
	image_blend = c_black;
	image_alpha -= 2 * global.delta_seconds;

	if !image_alpha{
		instance_destroy();
	}
}

depth = -y;