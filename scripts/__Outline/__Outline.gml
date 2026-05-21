
/// @desc Reset the default shader.
function outline_end() {
    if (shader_current() == __ShdOutline) {
        shader_reset();
    }
};
