package entity

import rl "vendor:raylib"
import "core:fmt"
import "../lib"

Bullet :: struct {
    using entity: Entity,
    dir: f32,
    collider: lib.Circle,
    lifetime: bool,
}

gen_bullet :: proc(self: ^Player) {
    for &b in self.ammo {
        b: Bullet = {
            {
                {0.0, 0.0}, {0.0, 0.0}, {32, 32},
                { lib.Anim {
                    rl.LoadTexture("assets/img/player/lvl3.png"),
                    32,
                    4,
                    0,
                    lib.Timer {0.0, 0.1},
                    true,
                }},
                {0, 0, 32, 32}, {0, 0, 32, 32}
            },
            0.0,
            lib.Circle { 0.0, 4.0 },
            false,
        }
        b = b
    }
}

update_bullet :: proc(dt: f32, self: ^Bullet) {
    lib.play(dt, &self.reel[1])

    self.dest.x = self.pos.x
    self.dest.y = self.pos.y
    self.source.x = f32(32 * self.reel[0].current)

    self.collider.origin = self.pos

    self.pos += self.vel * dt
}

draw_bullet :: proc(self: ^Bullet, debug: bool) {
    rl.DrawTexturePro(self.reel[0].texture, self.source, self.dest, self.size/2, 90 + lib.degrees(self.dir), rl.WHITE)
    if debug == true {
        rl.DrawCircleV(self.collider.origin, self.collider.radius, rl.Color {200, 50, 50, 100})
    }
}
