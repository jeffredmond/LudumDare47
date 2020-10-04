
draw_set_color(c_black); 
draw_rectangle(0,0, screen_width, screen_heigth, false ); 

draw_set_font(font_game_over);
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_valign(fa_middle);
draw_set_halign(fa_center); 
draw_text(screen_center_x, screen_center_y, game_over_text)