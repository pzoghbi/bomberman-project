/// @description 
alarm[9] = ONE_SEC * 60;
with (o_player) {
	bombs_max++;
	bombs_strength++;
	bombs_time -= ONE_SEC / 4;
}

floating_text = "Gameplay intensifies";
alarm[2] = ONE_SEC;