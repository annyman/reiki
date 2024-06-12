package lib

import rl "vendor:raylib"
import "core:math"

Ray :: struct {
    origin: rl.Vector2,
    poynt: f32,
    len: f32,
    collide: bool,
}

attach_ray :: proc(self: ^Ray, origin: rl.Vector2) {
    self.origin = origin
}

debug_ray :: proc(self: ^Ray) {
    rl.DrawLineV(self.origin, self.origin + angToCoord(self.poynt, self.len), rl.GREEN)
}

// ---

Circle :: struct {
    origin: rl.Vector2,
    radius: f32,
}
