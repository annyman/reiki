package lib

import rl "vendor:raylib"
import "core:math"

Ray :: struct {
    origin: rl.Vector2,
    poynt: f32,
    len: f32,
    collide: bool,
}

attachRay :: proc(self: ^Ray, origin: rl.Vector2) {
    self.origin = origin
}

debugRay :: proc(self: ^Ray) {
    rl.DrawLineV(self.origin, self.origin + angToCoord(self.poynt, self.len), rl.GREEN)
}
