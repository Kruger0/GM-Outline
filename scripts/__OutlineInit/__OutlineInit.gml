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

OutlineStyleCreate("default", #000000, 1, 1, 0, 1, 0, true);