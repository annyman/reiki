package entity

import rl "vendor:raylib"
import "../lib"

Entity :: struct {
    pos, vel, size: rl.Vector2,
    texture: rl.Texture2D,
    source, dest: rl.Rectangle,
}

update :: proc {update_player, update_bullet}
draw :: proc {draw_player, draw_bullet}
