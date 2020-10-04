///@description scr_find_map_ind
///@arg map_size
///@arg 1_lower_or_2_uppper


var xx = 0 repeat(argument0){
	with obj_obs{
		var type
		type = current_obs;
		type += string(xx);
		type += current_type;	
		if(argument1 == 1){
			if(map_lower_track[? type] == undefined ||	map_lower_track[? type] == -10 || ds_map_empty(map_lower_track)){
				return xx; 
				exit;
			} 
		}
		else {
			if(argument1 == 2){
				if(map_upper_track[? type] == undefined ||	map_upper_track[? type] == -10 || ds_map_empty(map_upper_track)){
					return xx; 
					exit; 
				} 	
			}
		}
	}	
	xx++;
}
return -1; 