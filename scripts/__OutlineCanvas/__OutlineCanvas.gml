/// @ignore
function __OutlineCanvasCleanup() {
    static cache = __OutlineCache();
    var _canvas = cache.canvas;
    var _count = array_length(_canvas.refs);
    
    if (_count > 0) {
        var i = _canvas.cursor;
        repeat(min(_canvas.step, _count)) {
            if (weak_ref_alive(_canvas.refs[i])) {
                i = (i + 1) mod _count;
            } else {
                var _surf = _canvas.meta[i];            
                if (_surf != application_surface) {
                    if (surface_exists(_surf)) {
                        surface_free(_surf);
                        show_debug_message($"[OUTLINE] - Surface {_surf} free from memory!");
                    }
                }
                array_delete(_canvas.refs, i, 1);
                array_delete(_canvas.meta, i, 1);
                --_count;
                
                if (_count > 0) {
                    i = i mod _count;
                } else {
                    i = 0;
                }
            }
        }
        _canvas.cursor = i;
    }
}

/// @ignore
function __OutlineCanvasCreate(width, height) {
    static cache = __OutlineCache();
    var _surf = surface_create(width, height);
    var _ref = {surf: _surf};
    array_push(cache.canvas.refs, weak_ref_create(_ref));
    array_push(cache.canvas.meta, _surf);
    return _ref;
}

/// @ignore
function __OutlineCanvasGet(width, height) {
    static cache = __OutlineCache();
    var _canvas     = cache.canvas;
    var _pool       = _canvas.pool;
    var _my_surf    = -1;
    var _surf_found = false;
    
    for (var i = 0, _len = array_length(_pool); i < _len; i++) {
        var _entry = _pool[i];
        if (is_struct(_entry) && surface_exists(_entry.surf)) {
            if (surface_get_width(_entry.surf) >= width && surface_get_height(_entry.surf) >= height) {
                _my_surf    = _entry;
                _surf_found = true;
            }
        }
    }
    
    if (!_surf_found) {
        _my_surf = __OutlineCanvasCreate(max(width, _canvas.size), max(height, _canvas.size));
        array_push(_pool, _my_surf);
    }
    
    return _my_surf.surf;
}
