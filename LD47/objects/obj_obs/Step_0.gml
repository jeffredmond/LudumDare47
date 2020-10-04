
distance = distance + obs_speed; 

//possibly insert logic here to handle what happens when the player approches next leve
//or use a level up flag in the game obj and use that as a central location to update all the game
//data. have that as a todo later after obj funct works



if(init_time_buffer > 0) {
	init_time_buffer--; 
	exit; 
}

if(obs_upper_offset > 0 ){
	obs_upper_offset--; 
}
if(obs_lower_offset	> 0){
	obs_lower_offset--; 
}

//super super gross workaround comingup

if(obs_upper_offset == 0 && obs_top_cur_number <= obs_max_number){
	//create new obs
	var obsNx, obsNtype, type, index_check
	index_check = scr_find_map_index(obs_max_number, 2);	
	if(index_check != -1){
		obsNx = current_obs;
		obsNx += string(index_check);
		obsNx += current_x;
		ds_map_add(map_upper_track, obsNx, track_start_x);

		obsNtype = current_obs;
		obsNtype += string(index_check);
		obsNtype += current_type;
		var xx = choose(0,1,2); 
		var bigchungus = choose(0,1,2,3,4,5)
		if(bigchungus == 0) xx = 3; 
		//key generation section of the game
			if(distance < -1000 && !key_list[| 0] && !key_exists){
				generate_key = true;
				key_exists = true;
				key_list[| 0] = true;
			}else if (distance < -2000 && !key_list[| 1]&& !key_exists){
				generate_key = true;
				key_exists = true;
				key_list[| 1] = true;			
			}else if (distance < -4000 && !key_list[| 2]&& !key_exists){
				generate_key = true;
				key_exists = true;
				key_list[| 2] = true;			
			}else if (distance < -8000 && !key_list[| 3]&& !key_exists){
				generate_key = true;
				key_exists = true;
				key_list[| 3] = true;			
			}else if (distance < -16000  && !key_list[| 4]&& !key_exists){
				generate_key = true;
				key_exists = true;
				key_list[| 4] = true;			
			}
		
			if(generate_key){
				xx = 4
				generate_key = false;
			}
		ds_map_add(map_upper_track, obsNtype, xx);	
		
		if (map_upper_track[? obsNtype] == -10) {
			map_upper_track[? obsNx] = track_start_x;
			map_upper_track[? obsNtype] = xx;
		}
		
		obs_upper_offset = floor(random_range(obs_minimal_dist,obs_maximum_dist));
		obs_top_cur_number++; 
	}
}


if(obs_lower_offset	== 0 && obs_lower_cur_number <= obs_max_number){
	//create new obs
	var obsLNx, obsLNtype, Ltype
	index_check = scr_find_map_index(obs_max_number, 1);	
	if(index_check != -1){
		obsLNx = current_obs;
		obsLNx += string(index_check);
		obsLNx += current_x;
		ds_map_add(map_lower_track, obsLNx, track_start_x);
		
		
		obsLNtype = current_obs;
		obsLNtype += string(index_check);
		obsLNtype += current_type;
		var yy = choose(0,1,2); 

		var bigchungus = choose(0,1,2,3,4,5)
		if(bigchungus == 0) xx = 3; 
		ds_map_add(map_lower_track, obsLNtype, yy);		
		
		if (map_lower_track[? obsLNtype] == -10) {
			map_lower_track[? obsLNx] = track_start_x;
			map_lower_track[? obsLNtype] = yy;
		}
		
		obs_lower_cur_number++; 	
		obs_lower_offset = floor(random_range(obs_minimal_dist, obs_maximum_dist));
	}
}

//update the top obs x postion to the left

if(obs_top_cur_number >0){
	var xx =0 repeat(obs_max_number){
		obsNx = current_obs;
		obsNx += string(xx);
		obsNx += current_x;
		
		obsNtype = current_obs;
		obsNtype += string(xx);
		obsNtype += current_type;		
		
		//	could also add the logic for drawing the y height here 

		
		if(map_upper_track[? obsNtype] != -10 && !ds_map_empty(map_upper_track) && (map_upper_track[? obsNtype] != undefined )){
			with(obj_player){
				if((other.map_upper_track[? obsNx] + other.obs_speed) <= x  + colliding_buffer&& 
					(other.map_upper_track[? obsNx] + other.obs_speed ) >= x - colliding_buffer&&
					top_lane){
					switch(other.map_upper_track[? obsNtype]){
						case 0:
							if(!jumping) colliding = true; 
						break;
						case 1:
							if(!jumping) colliding = true;
						break;
						case 2:
							if(!crouch) colliding = true;
						break;
						case 3:
							colliding = true; 
						break;
						case 4:
							with(obj_boss){
								event_perform(ev_other, event_user(0)); 
							}
							other.map_upper_track[? obsNtype] = -10
							other.obs_top_cur_number--; 
							other.key_exists = false;
						break
					}		
				if(colliding) exit; 	
				}
			}			
			
			if(map_upper_track[? obsNx] + obs_speed < track_end_x){
				map_upper_track[? obsNtype] = -10
				obs_top_cur_number--; 
			} else {
				map_upper_track[? obsNx] += obs_speed; 
			}
			
		}
		xx++; 
	}
}
// update the lower obs x position to the left 
if(obs_lower_cur_number >0 ){
	var xx =0 repeat(obs_max_number){
		obsNx = current_obs;
		obsNx += string(xx);
		obsNx += current_x;
		
		obsNtype = current_obs;
		obsNtype += string(xx);
		obsNtype += current_type;

		//	could also add the logic for drawing the y height here 
		if(map_lower_track[? obsNtype] != -10 && map_lower_track[? obsNtype] != undefined && !ds_map_empty(map_lower_track)){		
			with(obj_player){
				if((other.map_lower_track[? obsNx] + other.obs_speed) <= x + colliding_buffer && 
				   (other.map_lower_track[? obsNx] + other.obs_speed) >= x - colliding_buffer &&
				   !top_lane){
					switch(other.map_lower_track[? obsNtype]){
						case 0:
							if(!jumping) colliding = true; 
						break;
						case 1:
							if(!jumping) colliding = true;
						break;
						case 2:
							if(!crouch) colliding = true;
						break;
						case 3:
							colliding = true; 
						break;
						case 4:
							with(obj_boss){
								event_perform(ev_other, event_user(0));
							}
						break
					}
				if(colliding) exit; 
				}
			}			
			
			if(map_lower_track[? obsNx] + obs_speed < track_end_x){
				map_lower_track[? obsNtype] = -10; 		
				obs_lower_cur_number--; 
			} else {
				map_lower_track[? obsNx] += obs_speed; 
			}
		}
		xx++; 
	}
}
ds_queue_create() 