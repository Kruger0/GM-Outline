/// @desc               Create a configuration struct for the outline.
/// @arg [line_width]   The thickness, in pixels, of the outline.
/// @arg [line_col]     The color of the outline.
/// @arg [line_alpha]   The alpha of the outline.
/// @arg [roundness]    The roundess factor of the outline.
/// @arg [tolerance]    The minimum alpha value a pixel need to become an outline.
/// @arg [resolution]   The resolution of the outline.
/// @arg [uv_bound]     Locks the shader on the sprite uv.
function ol_config(_width, _col, _alpha, _round, _tol, _res, _uv_bnd) {
    static config =  __OutlineCache().config
    return {
        line_width      : _width    ?? config.line_width,
        line_col        : _col      ?? config.line_col,
        line_alpha      : _alpha    ?? config.line_alpha,
        roundness       : _round    ?? config.roundness,
        tolerance       : _tol      ?? config.tolerance,
        resolution      : _res      ?? config.resolution,
        uv_bound_mode   : _uv_bnd   ?? config.uv_bound_mode,
    }
}


/// @desc               Set a default configuration struct for the outline.
/// @arg [line_width]   The thickness, in pixels, of the outline.
/// @arg [line_col]     The color of the outline.
/// @arg [line_alpha]   The alpha of the outline.
/// @arg [roundness]    The roundess factor of the outline.
/// @arg [tolerance]    The minimum alpha value a pixel need to become an outline.
/// @arg [resolution]   The resolution of the outline.
/// @arg [uv_bound]     Locks the shader on the sprite uv.
function outline_set_config(_width, _col, _alpha, _round, _tol, _res, _uv_bnd) {
    with (__OutlineCache().config) {
        line_width      = _width    ?? line_width;
        line_col        = _col      ?? line_col;
        line_alpha      = _alpha    ?? line_alpha;
        roundness       = _round    ?? roundness;
        tolerance       = _tol      ?? tolerance;
        resolution      = _res      ?? resolution;
        uv_bound_mode   = _uv_bnd   ?? uv_bound_mode;
    }
}

/// @desc               Creates a new outline style to be used globally
/// @arg [width]        The thickness of the outline in pixels.
/// @arg [color]        The color of the outline.
/// @arg [alpha]        The alpha of the outline.
/// @arg [roundness]    The roundness factor of the outline.
/// @arg [cutoff]       The minimum alpha value a pixel must have to produce an outline.
/// @arg [resolution]   The resolution of the outline.
/// @arg [uv_bound]     Locks the shader to the sprite UV bounds.
function OutlineStyleCreate(name, width, color, alpha, roundness, cutoff, resolution, uv_bound) {
    static cache = __OutlineCache();
    cache.styles[$ name] = {
        color,
        alpha,
        width,
        cutoff,
        resolution, // TODO where is it passed?
        roundness,
        uv_bound,
    }
}

function OutlineStyleDelete(name) {
    static cache = __OutlineCache();
    struct_remove(cache.styles, name);
}
