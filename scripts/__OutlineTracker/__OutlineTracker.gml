/// @ignore
function __OutlineTracker() {
    // Method originaly created by JujuAdams
    // After the global cache this is kind of unnecessary but anyways...
    static cache = __OutlineCache();
    var _mng = cache.surface_mng;
    var _size = array_length(_mng.structs);
    
    if (_size > 0) {
        
        var i = _mng.test_index;
        repeat(min(4, _size)) { // Max iterarions per step
            if (weak_ref_alive(_mng.structs[i])) {
                i = (i + 1) mod _size;
            } else {
                var _surf = _mng.meta[i].surf;
                                
                if (_surf != application_surface) {
                    if (surface_exists(_surf)) {
                        surface_free(_surf);
                        show_debug_message($"[OUTLINE] - Surface {_surf} free from memory!");
                    }
                }
                
                array_delete(_mng.structs, i, 1);
                array_delete(_mng.meta, i, 1);
                --_size;
                
                if (_size > 0) {
                    i = i mod _size;
                } else {
                    i = 0;
                }
            }
        }
        _mng.test_index = i;
    }
}

call_later(1, time_source_units_seconds, __OutlineTracker, true);


/// @ignore
function __outline_surface_create(_wid, _hei) {
    static cache = __OutlineCache();
    var _surf = surface_create(_wid, _hei);
    
    var _struct = {surf: _surf};
    array_push(cache.surface_mng.structs, weak_ref_create(_struct));
    
    var _meta = {surf: _surf};
    array_push(cache.surface_mng.meta, _meta);
    
    return _struct;
}


/// @ignore
function __outline_surface_get(_wid, _hei) {
    static cache = __OutlineCache();
    var _mng        = cache.surface_mng;
    var _array      = _mng.cache;
    var _index      = 0;
    var _surf       = -1;
    var _my_surf    = -1;
    var _surf_found = false;

    for (var i = 0, _len = array_length(_array); i < _len; i++) {
        _index = _array[i];
        if (is_struct(_index)) {
            _surf = _index.surf;
            if (surface_exists(_surf)) {
                if (surface_get_width(_surf) >= _wid && surface_get_height(_surf) >= _hei) {
                    _my_surf    = _index;
                    _surf_found = true;
                }
            }
        }
    }
    
    if !(_surf_found) {
        _my_surf = __outline_surface_create(max(_wid, OUTLINE_CACHE_TEX_SIZE), max(_hei, OUTLINE_CACHE_TEX_SIZE));
        array_push(_array, _my_surf);
    }
    
    return _my_surf.surf;
}
  