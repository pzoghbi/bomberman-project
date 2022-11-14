var list = argument[0];
var return_val;
if is_array(list)
{
	return_val = array_length_1d(list);
}
else if ds_exists(list, ds_type_list)
{
	return_val = ds_list_size(list);
}
return return_val;