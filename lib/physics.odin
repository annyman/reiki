package lib

import rl "vendor:raylib"
import "core:math"

Ray :: struct {
    origin, arrow: rl.Vector2,
    collide: bool,
}
