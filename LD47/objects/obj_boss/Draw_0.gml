/// @description Insert description here
// You can write your code in this editor
//draw boss
draw_sprite(boss_sprite,0,screen_center_x_boss,screen_center_y_boss);

//draw boss health bar 
draw_set_valign(fa_top);
draw_set_font(font_boss_name);
draw_text_color(boss_name_x, boss_name_y, boss_name, c_white, c_white,c_red,c_red, 1);
draw_rectangle_color(boss_health_bar_x1-boss_health_bar_outline, boss_health_bar_y1-boss_health_bar_outline, 
					 boss_health_bar_x2+boss_health_bar_outline,boss_health_bar_y2+boss_health_bar_outline, 
					 c_white,c_white,c_white,c_white,true);
					 
draw_rectangle_color(boss_health_bar_x1, boss_health_bar_y1,
					(boss_health_bar_x1 + ((boss_health_bar_length)*(boss_health)*.01)),
					 boss_health_bar_y2, c_red,c_red,
					 c_red, c_red, false); 

