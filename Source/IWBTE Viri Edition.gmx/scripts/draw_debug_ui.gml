/// draw_debug_ui(player_instance, draw_x, draw_y, color, monospaced_font)
// Draws a debug overlay with the information:
// X, Y Coordinate (with V-Align)
// Horizontal Alignment (0 / 1 / 2)
// Current room name
// Current true fps, and normal fps (room_speed)

// This script is reusable as the data is pulled from the provided player_instance

var textColor = argument3;
var drawX = argument1;
var drawY = argument2;
    
draw_set_alpha(1.0);
draw_set_font(argument4);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

with(argument0) {
    var fpsreal = string(round(min(fps_real, 9999)));
    var debugtext = "(" + string(x) + ", " + string(y) + ") "; // Coordinates
    debugtext += "align " + string(x % 3) + " @ "; // H-Align
    debugtext += room_get_name(room); // Room Name
    debugtext += " / " + fpsreal + " fps ";
    
    // Pad (xx apparent) fps with spaces, assuming max fps_real is 9999 (ensured above)
    for(var i = 0; i < (4 - string_length(fpsreal)); i++)
        debugtext += " ";
    
    debugtext += "(" + string(round(fps)) + " apparent)";
    
    if(global.god)
        debugtext += " [god]";
    
    draw_set_color(textColor);
    draw_text(drawX, drawY, debugtext);
}