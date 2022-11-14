/// @description 
display_set_gui_size(room_width, room_height);

if !surface_exists(surf){
	surf = surface_create(room_width, room_height);
}

surface_set_target(surf);
draw_clear_alpha(c_black, .5);
surface_reset_target();

if (global.game_state==""){
	draw_surface(surf, 0, 0);
	// draw gui elems
	draw_set_font(font_ui);
	draw_text(32, 4, "Choose items for the match: " + string(item_amount) + " remaining");
	draw_sprite(s_gui_item_buttons, 0, 32, 32);
	var draw_margin_x = 96;
	for(var item_col = 0; item_col < array_length_2d(items, SPRITE); item_col++){
		draw_sprite(items[SPRITE, item_col], 0, 32*item_col + draw_margin_x, 32);
		if (item_index == item_col){
			draw_text(32, 64, items[DESCRIPTION, item_col]);
			var draw_x = 32*item_index + draw_margin_x;
			var draw_y = 32;
			draw_sprite(s_gui_item_selector, image_index / 16, draw_x, draw_y);
		}
		var draw_x = 32*item_col + draw_margin_x;
		var draw_y = 32;
		draw_text(draw_x, draw_y + 16, string(ds_list_find_count(global.itemlist, items[NAME, item_col])));
	}
} else {
	o_control.itemstack = ds_stack_create();
	
	for(var i = 0; i < ds_list_size(global.itemlist); i++){
		ds_stack_push(o_control.itemstack, ds_list_find_value(global.itemlist, i));
	}
	
	if surface_exists(surf) {
		surface_free(surf);
	}
	
	instance_deactivate_object(object_index);
}
