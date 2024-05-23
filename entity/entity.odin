package entity

import rl "vendor:raylib"
import "../lib"

Entity :: struct {
    pos, vel, size: rl.Vector2,
}

update :: proc {update_player}
draw :: proc {draw_player}
