/// @description 
/*
draw_text(50, 50, "Client");
draw_text(50, 100, "client: " + string(client));
draw_text(50, 150, "connect: " + string(connect));
*/

var index=0;
for(var i = 0; i < sprite_count; i++)
{
	var spr = ds_list_find_value(allsprites, index++);
	var img = ds_list_find_value(allsprites, index++);
	var pox = ds_list_find_value(allsprites, index++);
	var poy = ds_list_find_value(allsprites, index++); 
	var xsc = ds_list_find_value(allsprites, index++);
	var ysc = ds_list_find_value(allsprites, index++);
	var rot = ds_list_find_value(allsprites, index++);
	var col = ds_list_find_value(allsprites, index++);
	var alp = ds_list_find_value(allsprites, index++);
	
	draw_sprite_ext(int64(spr), int64(img), pox, poy, xsc, ysc, rot, int64(col), alp);
}
