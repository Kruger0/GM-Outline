
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
        
        styles: {},
        
        shader_supported    : false,
        shader_compiled     : false,
        support_traced      : false,
        compile_traced      : false,
        tracer: {
            not_supported   : "[OUTLINE] - Error: Shaders are not supported in this hardware",
            not_compiled    : "[OUTLINE] - Error: Main shader could not be compiled on this hardware",
        },
        
        uniforms: {
            line_color      : shader_get_uniform(__ShdOutline, "u_line_color"),
            pixel_size      : shader_get_uniform(__ShdOutline, "u_pixel_size"),
            thk_rn_tol      : shader_get_uniform(__ShdOutline, "u_thk_rn_tol"),
            uv              : shader_get_uniform(__ShdOutline, "u_uv"),
        },
            
        canvas: {
            ts      : undefined,
            size    : 64,
            step    : 4,
            pool    : [],
            refs    : [],
            meta    : [],
            cursor  : 0,
        },
        
        shader: {
            uniform: {
                //color,
                //texel,
                //wrc,
                //uv,
            },
            supported: {
                msg: "Shaders are not supported in this hardware",
                value: shaders_are_supported(),
                flag: false,
            },
            compiled: {
                msg: "Main shader could not be compiled on this hardware",
                value: shader_is_compiled(__ShdOutline),
                flag: false,
            },
            cleanup: {
                msg: "Surface {0} free from memory!"
            }
        }
    };
    return data;
}


