


/// @desc               Draw an outlined surface.
/// @arg id             The surface to be draw.
/// @arg x              The X coordinate of the surface.
/// @arg y              The Y coordinate of the surface.
/// @arg [style]        The style to use for the outline. Define it first before use
function outline_draw_surface(id, x, y, style = __OUTLINE_DEFAULT) {
    outline_set_surface(id, style);
    draw_surface(id, x, y);
    shader_reset();
}


/// @desc               Draw an outlined surface with extra formating.
/// @arg id             The surface to be draw.
/// @arg x              The X coordinate of the surface.
/// @arg y              The Y coordinate of the surface.
/// @arg xscale         The horizontal scaling of the surface.
/// @arg yscale         The vertical scaling of the surface.
/// @arg rot            The rotation of the surface.
/// @arg col            The color of the surface.
/// @arg alpha          The alpha of the surface.
/// @arg [style]        The style to use for the outline. Define it first before use
function outline_draw_surface_ext(_id, _x, _y, _xscale, _yscale, _rot, _col, _alpha, style = __OUTLINE_DEFAULT) {
    outline_set_surface(_id, style);
    draw_surface_ext(_id, _x, _y, _xscale, _yscale, _rot, _col, _alpha);
    shader_reset();
}


/// @desc               Draw an outlined surface with general transformation parameters.
/// @arg id             The surface to be draw.
/// @arg left           The left edge of the source rectangle on the surface.
/// @arg top            The top edge of the source rectangle on the surface.
/// @arg width          The width of the source rectangle on the surface.
/// @arg height         The height of the source rectangle on the surface.
/// @arg x              The X coordinate to draw the surface at.
/// @arg y              The Y coordinate to draw the surface at.
/// @arg xscale         The horizontal scaling of the surface.
/// @arg yscale         The vertical scaling of the surface.
/// @arg rot            The rotation of the surface.
/// @arg c1             The colour for the top left of the surface.
/// @arg c2             The colour for the top right of the surface.
/// @arg c3             The colour for the bottom right of the surface.
/// @arg c4             The colour for the bottom left of the surface.
/// @arg alpha          The alpha of the surface.
/// @arg [style]        The style to use for the outline. Define it first before use
function outline_draw_surface_general(_id, _left, _top, _width, _height, _x, _y, _xscale, _yscale, _rot, _c1, _c2, _c3, _c4, _surf_alpha, style = __OUTLINE_DEFAULT) {
    outline_set_surface(_id, style);
    draw_surface_general(_id, _left, _top, _width, _height, _x, _y, _xscale, _yscale, _rot, _c1, _c2, _c3, _c4, _surf_alpha);
    shader_reset();
}


/// @desc               Draw an outlined part of a surface.
/// @arg id             The surface to be draw.
/// @arg left           The left edge of the source rectangle on the surface.
/// @arg top            The top edge of the source rectangle on the surface.
/// @arg width          The width of the source rectangle on the surface.
/// @arg height         The height of the source rectangle on the surface.
/// @arg x              The X coordinate to draw the surface at.
/// @arg y              The Y coordinate to draw the surface at.
/// @arg [style]        The style to use for the outline. Define it first before use
function outline_draw_surface_part(_id, _left, _top, _width, _height, _x, _y, style = __OUTLINE_DEFAULT) {
    outline_set_surface(_id, style);
    draw_surface_part(_id, _left, _top, _width, _height, _x, _y);
    shader_reset();
}


/// @desc               Draw an outlined part of a surface with extra formating.
/// @arg id             The surface to be draw.
/// @arg left           The left edge of the source rectangle on the surface.
/// @arg top            The top edge of the source rectangle on the surface.
/// @arg width          The width of the source rectangle on the surface.
/// @arg height         The height of the source rectangle on the surface.
/// @arg x              The X coordinate to draw the surface at.
/// @arg y              The Y coordinate to draw the surface at.
/// @arg xscale         The horizontal scaling of the surface.
/// @arg yscale         The vertical scaling of the surface.
/// @arg col            The color of the surface.
/// @arg alpha          The alpha of the surface.
/// @arg [style]        The style to use for the outline. Define it first before use
function outline_draw_surface_part_ext(_id, _left, _top, _width, _height, _x, _y, _xscale, _yscale, _col, _alpha, style = __OUTLINE_DEFAULT) {
    outline_set_surface(_id, style);
    draw_surface_part_ext(_id, _left, _top, _width, _height, _x, _y, _xscale, _yscale, _col, _alpha);
    shader_reset();
}


/// @desc               Draw an outlined surface with stretched dimensions.
/// @arg id             The surface to be draw.
/// @arg x              The X coordinate of the surface.
/// @arg y              The Y coordinate of the surface.
/// @arg width          The width at which to draw the surface.
/// @arg height         The height at which to draw the surface.
/// @arg [style]        The style to use for the outline. Define it first before use
function outline_draw_surface_stretched(_id, _x, _y, _wid, _hei, style = __OUTLINE_DEFAULT) {
    outline_set_surface(_id, style);
    draw_surface_stretched(_id, _x, _y, _wid, _hei);
    shader_reset();
}


/// @desc               Draw an outlined surface with stretched dimensions and extra formating.
/// @arg id             The surface to be draw.
/// @arg x              The X coordinate of the surface.
/// @arg y              The Y coordinate of the surface.
/// @arg width          The width at which to draw the surface.
/// @arg height         The height at which to draw the surface.
/// @arg col            The color of the surface.
/// @arg alpha          The alpha of the surface.
/// @arg [style]        The style to use for the outline. Define it first before use
function outline_draw_surface_stretched_ext(_id, _x, _y, _wid, _hei, _col, _alpha, style = __OUTLINE_DEFAULT) {
    outline_set_surface(_id, style);
    draw_surface_stretched_ext(_id, _x, _y, _wid, _hei, _col, _alpha);
    shader_reset();
}


/// @desc               Draw an outlined surface tiled across the room.
/// @arg id             The surface to be draw.
/// @arg x              The X coordinate to start tiling from.
/// @arg y              The Y coordinate to start tiling from.
/// @arg [style]        The style to use for the outline. Define it first before use
function outline_draw_surface_tiled(_id, _x, _y, style = __OUTLINE_DEFAULT) {
    outline_set_surface(_id, style);
    draw_surface_tiled(_id, _x, _y);
    shader_reset();
}


/// @desc               Draw an outlined surface tiled across the room with extra formating.
/// @arg id             The surface to be draw.
/// @arg x              The X coordinate to start tiling from.
/// @arg y              The Y coordinate to start tiling from.
/// @arg xscale         The horizontal scaling of the surface.
/// @arg yscale         The vertical scaling of the surface.
/// @arg col            The color of the surface.
/// @arg alpha          The alpha of the surface.
/// @arg [style]        The style to use for the outline. Define it first before use
function outline_draw_surface_tiled_ext(_id, _x, _y, _xscale, _yscale, _col, _alpha, style = __OUTLINE_DEFAULT) {
    outline_set_surface(_id, style);
    draw_surface_tiled_ext(_id, _x, _y, _xscale, _yscale, _col, _alpha);
    shader_reset();
}