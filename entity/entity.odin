package entity

import rl "vendor:raylib"
import "../lib"

Entity :: struct {
    pos, vel, size: rl.Vector2,
    reel: []lib.Anim,
    source, dest: rl.Rectangle,
}

load :: proc {load_player}
update :: proc {update_player, update_bullet}
draw :: proc {draw_player, draw_bullet}
