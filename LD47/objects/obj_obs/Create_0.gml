/// @description Insert description here
// You can write your code in this editor

// create 2 ds maps for both the top and bottom rows. need to have a minimum size of gap between 
// each of the obs. the track is going to be broken into sections and will have different y's depending
// on what section they are in. but other than that they will just glide to the side. 

// there will be 9 sections that will have a different. y level. 
// the things needed for the obs will be
// x, y postion, type (3 types of obs), 
// speed will be a variable that can be modified and controlled seperatly 

// width is 32 blocks of 32x32 blocks 

colidable = true;

cellsize				= 20;

obs_minimal_dist		= cellsize*2;
obs_maximum_dist		= cellsize*10; 
obs_upper_init_offset	= floor(random_range(obs_minimal_dist, obs_maximum_dist));
obs_lower_init_offset	= floor(random_range(obs_minimal_dist, obs_maximum_dist));
obs_upper_offset		= obs_upper_init_offset;
obs_lower_offset		= obs_lower_init_offset;
obs_max_number			= 10;
obs_top_cur_number		= 0;
obs_lower_cur_number	= 0;
distance				= 0; 
key_exists				= false;
generate_key			= false; 

obs_speed				= -2;

track_upper_y			= 640;
track_lower_y			= 665;
track_x_buffer			= 32;
track_start_x			= room_width + track_x_buffer; 
track_end_x				= 0 - track_x_buffer;

enum obstacle {
	normal	= 0,
	low		= 1,
	high	= 2,
	impass	= 3,
	key		= 4
}

enum cur_distance {
	lvl1	= -5000,
	lvl2	= -10000,
	lvl3	= -15000
}

key_list				= ds_list_create();
key_list_size			= 5;

var xx = 0 repeat(key_list_size){
	key_list[| xx] = false; 	
}

map_upper_track			= ds_map_create();
map_lower_track			= ds_map_create();
current_obs				= "obstacle";
current_x				= "x";
current_y				= "y";
current_type			= "type"


init_time_buffer		= 50; 
