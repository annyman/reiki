package lib

import "vendor:raylib"
import "../lib"

Timer :: struct {
    tick: f32,
    length: f32,
}

timer_update :: proc(dt: f32, self: ^Timer) {
    self.tick += dt
}

timer_done :: proc(self: ^Timer) -> bool {
    if self.tick >= self.length {
        self.tick = 0.0
        return true
    } else {
        return false
    }
}
