
/// @ignore
function __OutlineCache(){
    static data = undefined;
    data ??= {    
        config: {
            line_width      : OUTLINE_LINE_WIDTH,
            line_col        : OUTLINE_LINE_COLOR,
            line_alpha      : OUTLINE_LINE_ALPHA,
            tolerance       : OUTLINE_TOLERANCE,
            resolution      : OUTLINE_RESOLUTION,
            roundness       : OUTLINE_ROUNDNESS,
            uv_bound_mode   : OUTLINE_UV_BOUND_MODE,
        },
        
        styles: {
            base: {
                stroke: 1,
                
            }
        },
        
        shader_supported    : false,
        shader_compiled     : false,
        support_traced      : false,
        compile_traced      : false,
            
        uniforms: {
            line_color      : shader_get_uniform(__ShdOutline, "u_line_color"),
            pixel_size      : shader_get_uniform(__ShdOutline, "u_pixel_size"),
            thk_rn_tol      : shader_get_uniform(__ShdOutline, "u_thk_rn_tol"),
            uv              : shader_get_uniform(__ShdOutline, "u_uv"),
        },
    
        surface_mng: {
            cache           : [],
            structs         : [],
            meta            : [],
            test_index      : 0,
        },
            
        tracer: {
            not_supported   : "[OUTLINE] - Error: Shaders are not supported in this hardware",
            not_compiled    : "[OUTLINE] - Error: Main shader could not be compiled on this hardware",
        },
    };
    return data;
}


// Check it resource is supported
if (shaders_are_supported()) {
    __OutlineCache().shader_supported = true;
    if (shader_is_compiled(__ShdOutline)) {
        __OutlineCache().shader_compiled = true;
    } else {
        show_debug_message(__OutlineCache().tracer.not_compiled);
        __OutlineCache().compile_traced = true;
    }
} else {
    show_debug_message(__OutlineCache().tracer.not_supported);
    __OutlineCache().support_traced = true;
}





/// @desc    Reset the default shader.
function outline_end() {
    if (shader_current() == __ShdOutline) {
        shader_reset();
    }
};



