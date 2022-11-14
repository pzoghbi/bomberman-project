/// @description 
var gp = -1;
if ds_list_size(Input.gamepads) {
	gp = Input.gamepads[|0];
}



/* navigate */
if (can_move_menu){
	if gamepad_axis_value(gp, gp_axislh) > 0.5 {
		item_index++;
		can_move_menu = false;
	}

	if gamepad_axis_value(gp, gp_axislh) < -0.5 {
		item_index--;
		can_move_menu = false;
	}
	
	if gamepad_axis_value(gp, gp_axislv) > 0.5 {
		item_amount--;
		can_move_menu = false;
	}

	if gamepad_axis_value(gp, gp_axislv) < -0.5 {
		item_amount++;
		can_move_menu = false;
	}
	item_amount = clamp(item_amount, 0, item_amount_max);
} else {
	if abs(gamepad_axis_value(gp, gp_axislh)) < 0.5
	{
		can_move_menu = true;
	}
}

// item index clamping
if item_index > 3 {
	item_index = 0;
} else if item_index < 0 {
	item_index = 3;
}

/* buttons */
if (gamepad_button_check_pressed(gp, gp_face1)){
	// add currently selected item index to item stack
	if (item_amount) {
		ds_list_add(global.itemlist, items[NAME, item_index]);
		item_amount -= 1;
		item_amount_max -= 1;
	}
}
if (gamepad_button_check_pressed(gp, gp_face3)){
	// remove item from stack
	if (ds_list_find_count(global.itemlist, items[NAME, item_index])){
		var index = ds_list_find_index(global.itemlist, items[NAME, item_index]);
		ds_list_delete(global.itemlist, index);
		item_amount += 1;
		item_amount_max += 1;
	}
}
