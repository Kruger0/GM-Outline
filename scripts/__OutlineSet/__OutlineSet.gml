
/// @desc           Set the outline shader for the next draw texts.
/// @arg [style]    The style to use for the outline. Define it first before use
function outline_set_text(style = __OUTLINE_DEFAULT) {
    static cache = __OutlineInit();
    
    var _style = OutlineStyleGet(style);
    var _width  = _style.width;
    var _col    = _style.color;
    var _alpha  = _style.alpha;
    var _round  = _style.roundness;
    var _tol    = _style.cutoff;
    var _res    = _style.resolution;
    var _uv_bnd = _style.uv_bound;
        
    var _font = draw_get_font();
    var _tex = font_get_texture(_font);
    var _uv = _uv_bnd ? font_get_uvs(_font) : cache.uv;
    
    __OutlineShaderBind(_tex, _uv, _width, _col, _alpha, _tol, _res, _round, _uv);
}


/// @desc           Set the outline shader for the next draw sprite.
/// @arg sprite     The sprite to be draw.
/// @arg subimg     The subimg of the sprite to be used.
/// @arg [style]    The style to use for the outline. Define it first before use
function outline_set_sprite(sprite, subimg, style = __OUTLINE_DEFAULT) {
    static cache = __OutlineInit();
    
    var _style  = OutlineStyleGet(style);
    var _width  = _style.width;
    var _col    = _style.color;
    var _alpha  = _style.alpha;
    var _round  = _style.roundness;
    var _tol    = _style.cutoff;
    var _res    = _style.resolution;
    var _uv_bnd = _style.uv_bound;
    
    var _tex    = sprite_get_texture(sprite, subimg);
    var _uv     = _uv_bnd ? sprite_get_uvs(sprite, subimg) : cache.uv;
    
    __OutlineShaderBind(_tex, _uv, _width, _col, _alpha, _tol, _res, _round, _uv);
}


/// @desc           Set the outline shader for the next draw surface.
/// @arg id         The surface to be draw.
/// @arg [style]    The style to use for the outline. Define it first before use
function outline_set_surface(_id, style = __OUTLINE_DEFAULT) {
    static cache = __OutlineInit();
    
    var _style = OutlineStyleGet(style);
    var _width  = _style.width;
    var _col    = _style.color;
    var _alpha  = _style.alpha;
    var _round  = _style.roundness;
    var _tol    = _style.cutoff;
    var _res    = _style.resolution;
    var _uv_bnd = _style.uv_bound;
        
    var _tex    = surface_get_texture(_id);
    var _uv     = _uv_bnd ? texture_get_uvs(_tex) : cache.uv;
    
    __OutlineShaderBind(_tex, _uv, _width, _col, _alpha, _tol, _res, _round, _uv_bnd);
}
