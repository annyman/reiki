package entity

import rl "vendor:raylib"
import "../lib"

Player :: struct {
    using entity: Entity,

    look: f32,
    texture: rl.Texture2D,
    source: rl.Rectangle,
    dest: rl.Rectangle,
}

update_player :: proc (dt: f32, self: ^Player) {
    switch rl.GetKeyPressed() {
        case .A: self.vel.x -= 400
        case .D: self.vel.x += 400
        case .W: self.vel.y -= 400
        case .S: self.vel.y += 400
        case : self.vel = {0, 0}
    }

    self.pos += self.vel * dt

    self.look = lib.dir(self.pos - rl.GetMousePosition())
}

draw_player :: proc (self: ^Player) {
    rl.DrawTextureEx(self.texture, self.pos, self.look, 0, rl.WHITE)
}
