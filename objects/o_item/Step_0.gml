/// @description Insert description here
// You can write your code in this editor

var player=collision_rectangle(x+8, y+8, x+24, y+24, o_player, false, false);
var explosion=collision_rectangle(x+8, y+8, x+24, y+24, o_explosion, false, false);

if (explosion) {
	//instance_change(o_explosion, 1);
}

switch(name){
	case "+bomb":
	{
		sprite_index=s_item_bomb;
		if (player){
			// increate player's max bombs
			player.bombs_max += 1;
			instance_destroy();	
			audio_play_sound(a_item_pickup, 1, 0);
		}	
	}
	break;
	case "+strength":
	{
		sprite_index=s_item_bomb_strength;
		if (player){
			// increate player's max bombs
			player.bombs_strength += 1;
			instance_destroy();	
			audio_play_sound(a_item_pickup, 1, 0);
		}	
	}
	break;
	case "+speed":
	{
		sprite_index=s_item_boots;
		if (player){
			// increate player's max bombs
			player.move_speed += 16;
			instance_destroy();	
			audio_play_sound(a_item_pickup, 1, 0);
		}	
	}
	break;
	case "+kick":
	{
		sprite_index=s_item_kick;
		if (player){
			// increate player's max bombs
			player.can_kick = true;
			instance_destroy();	
			audio_play_sound(a_item_pickup, 1, 0);
		}	
	}
	break;
	default:
	break;
}


