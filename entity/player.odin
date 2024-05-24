package entity

import rl "vendor:raylib"
import "core:fmt"
import "../lib"

Player :: struct {
    using entity: Entity,

    look: lib.Ray,
    texture: rl.Texture2D,
    source, dest: rl.Rectangle,
}

update_player :: proc (dt: f32, self: ^Player) {
//    self.vel = 300 * lib.norm(self.vel)
//    self.pos += self.vel * dt

    self.look = {self.pos, lib.dir(rl.GetMousePosition() - self.pos), 35, false}

    lib.attachRay(&self.look, self.pos)

    self.dest.x = self.pos.x
    self.dest.y = self.pos.y
}

draw_player :: proc (self: ^Player, debug: bool) {
    rl.DrawTexturePro(self.texture, self.source, self.dest, self.size/2, 90 + lib.degrees(self.look.poynt), rl.WHITE)
    if debug == true {
        lib.debugRay(&self.look)
    }
}
