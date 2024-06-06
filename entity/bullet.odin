package entity

import rl "vendor:raylib"
import "core:fmt"
import "../lib"

Bullet :: struct {
    using entity: Entity,
    dir: f32,
    collider: lib.Circle,
    //lifetime: lib.Timer
}

update_bullet :: proc(dt: f32, self: ^Bullet) {
    self.dest.x = self.pos.x
    self.dest.y = self.pos.y

    self.collider.origin = self.pos

    self.pos += self.vel * dt
}

draw_bullet :: proc(self: ^Bullet, debug: bool) {
    rl.DrawTexturePro(self.texture, self.source, self.dest, self.size/2, 90 + lib.degrees(self.dir), rl.WHITE)
    if debug == true {
        rl.DrawCircleV(self.collider.origin, self.collider.radius, rl.Color {0, 225, 0, 100})
    }
}
