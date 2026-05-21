
function __OutlineInit() {
    static cache = __OutlineCache();
    
    // Check compatibility
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
    
    // Create default style
    OutlineStyleCreate("default", #000000, 1, 1, 0, 1, 0, true);
    
    // Start Garbage Collector
    var _canvas = cache.canvas;
    if (time_source_exists(_canvas.ts)) {
        time_source_destroy(_canvas.ts, true);
    }
    _canvas.ts = time_source_create(time_source_global, 1, time_source_units_seconds, __OutlineCanvasCleanup);
    time_source_start(_canvas.ts);
}

__OutlineInit();
