
/// @desc           Defines the default style used by the system
/// @arg width      The thickness of the outline in pixels.
/// @arg color      The color of the outline.
/// @arg alpha      The alpha of the outline.
/// @arg roundness  The roundness factor of the outline.
/// @arg cutoff     The minimum alpha value a pixel must have to produce an outline.
/// @arg resolution The resolution of the outline.
/// @arg uv_bound   Locks the shader to the sprite UV bounds.
function OutlineStyleDefault(width, color, alpha, roundness, cutoff, resolution, uv_bound) {
    static cache = __OutlineInit();
    cache.styles[$ __OUTLINE_DEFAULT] = {
        width,
        color,
        alpha,
        roundness,
        cutoff,
        resolution,
        uv_bound,
    }
}

/// @desc           Creates a new outline style to be used globally
/// @arg name       The name of the style to create.
/// @arg width      The thickness of the outline in pixels.
/// @arg color      The color of the outline.
/// @arg alpha      The alpha of the outline.
/// @arg roundness  The roundness factor of the outline.
/// @arg cutoff     The minimum alpha value a pixel must have to produce an outline.
/// @arg resolution The resolution of the outline.
/// @arg uv_bound   Locks the shader to the sprite UV bounds.
function OutlineStyleCreate(name, width, color, alpha, roundness, cutoff, resolution, uv_bound) {
    static cache = __OutlineInit();
    cache.styles[$ name] = {
        width,
        color,
        alpha,
        roundness,
        cutoff,
        resolution,
        uv_bound,
    }
}

/// @desc           Updates an existing outline style
/// @arg name       The name of the style to update.
/// @arg width      The thickness of the outline in pixels.
/// @arg color      The color of the outline.
/// @arg alpha      The alpha of the outline.
/// @arg roundness  The roundness factor of the outline.
/// @arg cutoff     The minimum alpha value a pixel must have to produce an outline.
/// @arg resolution The resolution of the outline.
/// @arg uv_bound   Locks the shader to the sprite UV bounds.
function OutlineStyleUpdate(name, width, color, alpha, roundness, cutoff, resolution, uv_bound) {
    OutlineStyleCreate(name, width, color, alpha, roundness, cutoff, resolution, uv_bound);
}

/// @desc       Deletes a previously created style.
/// @arg name   The name of the style to delete.
function OutlineStyleDelete(name) {
    static cache = __OutlineInit();
    if (name == __OUTLINE_DEFAULT) {
        show_debug_message("[Outline] Cannot delete the default style.");
        return;
    }
    struct_remove(cache.styles, name);
}

/// @desc       Get the given style as a struct, or undefined it the style doesn't exists.
/// @arg name   The name of the style to get.
function OutlineStyleGet(name) {
    static cache = __OutlineInit();
    return cache.styles[$ name]
}

/// @desc       Get default style as a struct.
function OutlineStyleGetDefault() {
    static cache = __OutlineInit();
    return cache.styles[$ __OUTLINE_DEFAULT];
}

