
/// @ignore
function __OutlineInit(){
    static data = undefined;
    data ??= {    
        styles: {},
        uv: [0.0, 0.0, 1.0, 1.0],
        canvas: {
            timeSource : undefined,
            minTexSize : 256,
            stepSize : 4,
            cursor : 0,
            pool : [],
            refs : [],
            meta : [],
        },
        shader: {
            supported: shaders_are_supported(),
            base: {
                ref: __shdOutlineBase,
                compiled: false,
                startup: function() {
                    uniform = {
                        color: shader_get_uniform(ref, "u_line_color"),
                        texel: shader_get_uniform(ref, "u_pixel_size"),
                        wrc: shader_get_uniform(ref, "u_thk_rn_tol"),
                        uv: shader_get_uniform(ref, "u_uv"),
                    }
                }
            }
        }
    };
    
    // Initialize shaders
    with (data.shader) {
        if (supported) {
            with (base) {
                if (shader_is_compiled(ref)) {
                    compiled = true;
                } else {
                    __OutlineTrace(OUTLINE_TRACE.CRITICAL, $"Shader '{shader_get_name(ref)}' could not be compiled for this platform");
                }
                startup();
            }
        } else {
            __OutlineTrace(OUTLINE_TRACE.CRITICAL, "Shaders are not supported in this platform");
        }
    }
    
    // Initialize garbage collector
    with (data.canvas) {
        if (time_source_exists(timeSource)) {
            time_source_destroy(timeSource, true);
        }
        timeSource = time_source_create(time_source_global, 1, time_source_units_seconds, __OutlineCanvasCleanup);
        time_source_start(timeSource);
    }
    
    return data;
}
