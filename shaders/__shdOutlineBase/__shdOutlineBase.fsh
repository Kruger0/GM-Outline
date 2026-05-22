#define MAX_THICKNESS 8.0

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 u_line_color;
uniform vec2 u_pixel_size;
uniform vec3 u_thk_rn_tol;  // Thickness, roundness, tolerance
uniform vec4 u_uv;

void main() {
    vec4  frag_col  = texture2D(gm_BaseTexture, v_vTexcoord);
    float thickness = min(abs(u_thk_rn_tol.x), MAX_THICKNESS);
    float roundness = clamp(u_thk_rn_tol.y, 0.0, 1.0);
    float tolerance = clamp(u_thk_rn_tol.z, 0.0, 1.0);
    bool  in_line   = u_thk_rn_tol.x < 0.0;
    float outline   = 0.0;

    if (frag_col.a <= tolerance ^^ in_line) {
        for (float xx = -MAX_THICKNESS; xx <= MAX_THICKNESS; xx++) {
            if (abs(xx) > thickness) continue;

            for (float yy = -MAX_THICKNESS; yy <= MAX_THICKNESS; yy++) {
                if (abs(yy) > thickness) continue;

                vec2 chk_pos = v_vTexcoord + vec2(xx, yy) * u_pixel_size;
                vec4 chk_col = texture2D(gm_BaseTexture, chk_pos);

                if (!(chk_col.a > tolerance ^^ in_line)) continue;

                bool out_bound = (chk_pos.x < u_uv.r || chk_pos.y < u_uv.g ||
                                  chk_pos.x > u_uv.b || chk_pos.y > u_uv.a);
                if (out_bound) continue;

                // FIX: correct distance metric, avoid sqrt when not needed
                vec2  offset = vec2(xx, yy) / thickness;
                float dist;
                if (roundness < 0.01) {
                    dist = max(abs(offset.x), abs(offset.y));
                } else if (roundness > 0.99) {
                    dist = length(offset);
                } else {
                    dist = mix(max(abs(offset.x), abs(offset.y)), length(offset), roundness);
                }

                if (dist <= 1.0) {
                    outline = 1.0;
                    break;
                }
            }

            if (outline == 1.0) break;
        }
    }

    gl_FragColor = mix(v_vColour * frag_col, u_line_color, outline);
}