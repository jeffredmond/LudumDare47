
draw_set_font(font_debug_info); 
draw_set_valign(fa_top); 
draw_set_halign(fa_left);
draw_text_color(0,0,string(distance), c_white, c_white, c_white, c_white, 1); 

var xx =0 repeat(obs_max_number){
var obsNx, obsNy, obsNtype, type

		obsNx = current_obs;
		obsNx += string(xx);
		obsNx += current_x;
		
		obsNtype = current_obs;
		obsNtype += string(xx);
		obsNtype += current_type;				
				
		draw_set_valign(fa_bottom);
		draw_set_halign(fa_center);	
		if(map_upper_track[? obsNtype] != -10 && map_upper_track[? obsNtype] != undefined && !ds_map_empty(map_upper_track) ){
			switch(map_upper_track[? obsNtype]){
			case 0:
				draw_sprite(spr_obs, 0, map_upper_track[? obsNx], track_upper_y ) 
				break;
			case 1: 
				draw_sprite(spr_obs_low, 0, map_upper_track[? obsNx], track_upper_y ) 
				break;
			case 2:
				draw_sprite(spr_obs_high, 0, map_upper_track[? obsNx], track_upper_y ) 
				break;
			case 3: 
				draw_sprite(spr_obs_impass, 0, map_upper_track[? obsNx], track_upper_y )
				break;	
			case 4: 
				draw_sprite(spr_obs_key, 0, map_upper_track[? obsNx], track_upper_y )
				break;
			}			
		}
		xx++;
}

var yy =0 repeat(obs_max_number){
var obsNx, obsNy, obsNtype, type

		obsNx = current_obs;
		obsNx += string(yy);
		obsNx += current_x;
				
		obsNtype = current_obs;
		obsNtype += string(yy);
		obsNtype += current_type;
		if(map_lower_track[? obsNtype] != -10 && map_lower_track[? obsNtype] != undefined && !ds_map_empty(map_lower_track) ){
			switch(map_lower_track[? obsNtype]){
			case 0: draw_sprite(spr_obs, 0, map_lower_track[? obsNx], track_lower_y ); break;
			case 1: draw_sprite(spr_obs_low, 0, map_lower_track[? obsNx], track_lower_y ); break;
			case 2: draw_sprite(spr_obs_high, 0, map_lower_track[? obsNx], track_lower_y ); break;
			case 3: draw_sprite(spr_obs_impass, 0, map_lower_track[? obsNx], track_lower_y ); break;
			}				
			//draw_sprite(greasyfix3, 0, map_lower_track[? obsNx], track_lower_y );
		}
		yy++; 
}
