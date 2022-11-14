/// @description Insert description here
// You can write your code in this editor


//horizontal collision
if place_meeting(x + sign(h_speed) * 16, y, o_solid)
or place_meeting(x + sign(h_speed) * 16, y, o_bomb) 
or place_meeting(x + sign(h_speed) * 16, y, o_player)
{
	if (is_bouncy) {
		h_speed = -h_speed;
	} else {
		h_speed = 0;
	}
}
//vertical collision
// with solid
if place_meeting(x, y + sign(v_speed) * 16, o_solid)
or place_meeting(x, y + sign(v_speed) * 16, o_bomb)
or place_meeting(x, y + sign(v_speed) * 16, o_player){
	if (is_bouncy) {
		v_speed = -v_speed;
	} else {
		v_speed = 0;
	}
}

if (h_speed == 0 && v_speed == 0){
	x = round(x / TILE_SIZE) * TILE_SIZE;
	y = round(y / TILE_SIZE) * TILE_SIZE;
}

x += h_speed;
y += v_speed;

depth = -y;