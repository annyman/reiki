package entity

import rl "vendor:raylib"
import "../lib"

Entity :: struct {
    pos: rl.Vector2,
    vel: rl.Vector2,
    size: rl.Vector2,
}
