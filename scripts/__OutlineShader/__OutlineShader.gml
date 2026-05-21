
/// @ignore
function __outline_set_shader() {
    if (__OutlineCache().shader_compiled) {
        if (shader_current() != __ShdOutline) {
            shader_set(__ShdOutline);
        }
    } else {
        if (!__OutlineCache().compile_traced) {
            show_debug_message(__OutlineCache().tracer.not_compiled);
            __OutlineCache().compile_traced = true;
        }
    }
};


/// @ignore
function __outline_set_uniforms(_texture, _uv, _thick, _col, _alpha, _tol, _res, _round, _uv_bnd) {
    static uniforms = __OutlineCache().uniforms;
    var _w  = texture_get_texel_width(_texture);
    var _h  = texture_get_texel_height(_texture);
    
    shader_set_uniform_f(uniforms.line_color, 
        ((_col)       & 0xFF) / 255.0,
        ((_col >> 8)  & 0xFF) / 255.0,
        ((_col >> 16) & 0xFF) / 255.0,
        _alpha
    );
        
    shader_set_uniform_f(uniforms.pixel_size, _w*(1.0/_res), _h*(1.0/_res));
    shader_set_uniform_f(uniforms.thk_rn_tol, _thick*_res, _round, _tol);
    shader_set_uniform_f(uniforms.uv, _uv[0], _uv[1], _uv[2], _uv[3]);
};
