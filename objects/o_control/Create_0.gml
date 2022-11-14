/// @description Insert description here
// You can write your code in this editor

// destroy items that are not hosted
if (global.onHost == false) {
	instance_destroy(n_object);
}

devices = ds_map_create();
device_list = ds_list_create();

global.players[3]=-1;
global.players[2]=-1;
global.players[1]=-1;
global.players[0]=-1;

playerwins = ds_map_create();


	player_position[0] = [48, 48];
	player_position[1] = [272, 48];
	player_position[2] = [272, 272];
	player_position[3] = [48, 272];


/*
	player_positions[0, 0] = 48;
	player_positions[0, 1] = 48;
	player_positions[1, 0] = 272;
	player_positions[1, 1] = 48;
	player_positions[2, 0] = 272
	player_positions[2, 1] = 272;
	player_positions[3, 0] = 48;
	player_positions[3, 1] = 272;
*/
player_colors = [
	c_aqua, c_lime, 
	c_fuchsia, c_orange
	];

depth = -1000;
players_count = 0;
players_max = 4;

itemstack = ds_stack_create();
global.itemlist = ds_list_create();

X = 0;
floating_text = "";
#region level generation
/*
cols = room_width div TILE_SIZE;
rows = room_height div TILE_SIZE;

level_grid = ds_grid_create(cols, rows);


// set SOLIDs & floor
for(var i = 0; i < rows; i++) {

	for (var j = 0; j < cols; j++){
		// edges and corners
		if (i==0) || (i==rows-1) || (j==0) || (j == cols-1){
			level_grid[# j, i] = SOLID;
		}
		// middle solid walls
		else if (j % 2 == 0) && (i % 2 == 0){
			level_grid[# j, i] = SOLID;
		}
		// placing destructable walls
		else if (i > 1) && (j > 1) && (i < 8) && (j < 8){
			level_grid[# j, i] = WALL;
		}
		else level_grid[# j, i] = FLOOR;
	}

}


// |PRINT| grid in the room (place instances)
for(var i = 0; i < ds_grid_height(level_grid); i++){

	for (var j = 0; j < ds_grid_width(level_grid); j++){
		instance_create_depth(j*TILE_SIZE, i*TILE_SIZE, -200, Floor);
		
		switch(level_grid[# j, i]){
		case SOLID: {
				if !place_free(j*TILE_SIZE, i*TILE_SIZE){
					show_debug_message("PLACE DUPLICATE");
				}
			
				instance_create_depth(j*TILE_SIZE, i*TILE_SIZE, -300, o_solid);
			}
			break;
			
		case WALL:
			{
				instance_create_depth(j*TILE_SIZE, i*TILE_SIZE, -300, o_wall);
			}
			break;
		default:
			break;
		}
		
	}
	
}
*/
#endregion

//audio_play_sound(a_game_idle, 1, 1);

/* 
 *	This code represents newly brewed player slots and
 *	communication between input components and players
 *
 *
 */
 keyboard_enabled = false;