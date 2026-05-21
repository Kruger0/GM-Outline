
/// @desc               Draw an outlined sprite.
/// @arg sprite         The sprite to be draw.
/// @arg subimg         The subimg of the sprite to be used.
/// @arg x              The X coordinate of the sprite.
/// @arg y              The Y coordinate of the sprite.
/// @arg [style]        The style to use for the outline. Define it first before use
function outline_draw_sprite(_sprite, _subimg, _x, _y, style = __OUTLINE_DEFAULT) {
    outline_draw_sprite_ext(_sprite, _subimg, _x, _y, 1, 1, 0, draw_get_color(), draw_get_alpha(), style);
}


/// @desc               Draw an outlined sprite with extra formating.
/// @arg sprite         The sprite to be draw.
/// @arg subimg         The subimg of the sprite to be used.
/// @arg x              The X coordinate of the sprite.
/// @arg y              The Y coordinate of the sprite.
/// @arg xscale         The horizontal scaling of the sprite.
/// @arg yscale         The vertical scaling of the sprite.
/// @arg rot            The rotation of the sprite.
/// @arg colour         The color of the sprite.
/// @arg alpha          The alpha of the sprite.
/// @arg [style]        The style to use for the outline. Define it first before use
function outline_draw_sprite_ext(_sprite, _subimg, _x, _y, _xscale, _yscale, _rot, _spr_col, _spr_alpha, style = __OUTLINE_DEFAULT) {
    outline_set_sprite(_sprite, _subimg, style);
    draw_sprite_ext(_sprite, _subimg, _x, _y, _xscale, _yscale, _rot, _spr_col, _spr_alpha);
    shader_reset();
}


function outline_draw_sprite_general() {
    
}


function outline_draw_sprite_part() {
    
}


function outline_draw_sprite_part_ext() {
    
}


function outline_draw_sprite_pos() {
    
}


function outline_draw_sprite_stretched() {
    
}


function outline_draw_sprite_stretched_ext() {
    
}


function outline_draw_sprite_tiled() {
    
}


function outline_draw_sprite_tiled_ext() {
    
}