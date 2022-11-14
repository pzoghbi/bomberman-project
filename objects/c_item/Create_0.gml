/// @description 
//"+bomb", "+strength", "+speed", "+kick"

items[NAME, 0] = "+bomb";
items[SPRITE, 0] = s_item_bomb;
items[DESCRIPTION, 0] = "Increases player's max bombs by 1";


items[NAME, 1] = "+strength";
items[SPRITE, 1] = s_item_bomb_strength;
items[DESCRIPTION, 1] = "Increases player's bombs' strength by 1";


items[NAME, 2] = "+speed";
items[SPRITE, 2] = s_item_boots;
items[DESCRIPTION, 2] = "Permanently increases movement speed.";


items[NAME, 3] = "+kick";
items[SPRITE, 3] = s_item_kick;
items[DESCRIPTION, 3] = "Allows player to kick the bomb he\nis facing";

item_amount = 10 - ds_list_size(global.itemlist);
item_amount_max = 20 - ds_list_size(global.itemlist);

// menu
item_index = 3;
can_move_menu = true;

surf=-1;
depth = 0;