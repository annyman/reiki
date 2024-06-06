package entity

import rl "vendor:raylib"
import "core:fmt"
import "../lib"

Player :: struct {
    using entity: Entity,
    look: lib.Ray, // raycast mouse
    ammo: [dynamic]Bullet,
}

update_player :: proc (dt: f32, self: ^Player) {
    self.look = {self.pos, lib.dir(rl.GetMousePosition() - self.pos), self.look.len, false}

    lib.attachRay(&self.look, self.pos)

    move(self)

    if rl.IsMouseButtonPressed(.LEFT) {
        fire_bullet(self)
    }

    for &bullet in self.ammo {
        update(dt, &bullet)
    }

    self.dest.x = self.pos.x
    self.dest.y = self.pos.y

    self.pos += self.vel * dt
}

draw_player :: proc (self: ^Player, debug: bool) {

    for &bullet in self.ammo {
        draw(&bullet, debug)
    }

    rl.DrawTexturePro(self.texture, self.source, self.dest, self.size/2, 90 + lib.degrees(self.look.poynt), rl.WHITE)

    if debug == true {
        lib.debugRay(&self.look)
    }
}

move :: proc(self: ^Player) {

    if rl.IsKeyDown(.W) {
            self.vel = 5 * lib.angToCoord(self.look.poynt, self.look.len)
        } else if rl.IsKeyDown(.S) {
            self.vel = -5 * lib.angToCoord(self.look.poynt, self.look.len)
        } else {
            self.vel = 0
    }

}

fire_bullet :: proc(self: ^Player) {

    append(
        &self.ammo,
        Bullet {
            { self.pos, lib.angToCoord(self.look.poynt, 300), {32, 32},
            rl.LoadTexture("assets/img/player/lvl3.png"),
            {0, 0, 32, 32}, {self.pos.x, self.pos.y, 32, 32} },
            self.look.poynt,
            lib.Circle { self.pos, 4.0 }
        }
    )
}
