
function __OutlineShaderBind(texture, uv, width, color, alpha, cutoff, resolution, roundness, uv_bound) {
    static cache = __OutlineInit();
    if (!cache.shader.supported) return;
    
    with (cache.shader.base) {
        if (!compiled) return;
        if (shader_current() != ref) {
            shader_set(ref);
        }
        var _color  = [(color & 0xFF) / 255.0, ((color >> 8) & 0xFF) / 255.0, ((color >> 16) & 0xFF) / 255.0, alpha];
        var _texel  = [texture_get_texel_width(texture)*(1.0/resolution), texture_get_texel_height(texture)*(1.0/resolution)];
        var _wrc    = [width*resolution, roundness, cutoff];
        var _uv     = [uv[0], uv[1], uv[2], uv[3]];
    
        shader_set_uniform_f_array(uniform.color, _color);    
        shader_set_uniform_f_array(uniform.texel, _texel);
        shader_set_uniform_f_array(uniform.wrc, _wrc);
        shader_set_uniform_f_array(uniform.uv, _uv);
    }
}
