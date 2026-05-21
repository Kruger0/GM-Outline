draw_text(16, 16, $"Surf cache size: {array_length(__OutlineInit().canvas.pool)}")
draw_text(16, 32, $"Surf structs size: {array_length(__OutlineInit().canvas.refs)}")
draw_text(16, 48, $"Surf meta size: {array_length(__OutlineInit().canvas.meta)}")