/// @description Insert description here
// You can write your code in this editor
global.player_count++;

move_speed = 60;

h_speed = 0;
v_speed = 0;

/* initialize input variables*/ 
input_left =	false;
input_right =	false;
input_down =	false;
input_up =		false;
input_bomb =	false;
input_pause =	false;


bombs =				0;
bombs_max =			1;
bombs_time =		3 * ONE_SEC;
bombs_strength =	1;
bombs_type	=		"normal";

is_move_hor = 0;
is_move_ver = 0;
is_dead = false;

can_bomb = true;
can_kick = false;
dir_facing = floor(point_direction(x, y, room_width/2, room_height/2) / 90);
player = 1;
depth = -400;