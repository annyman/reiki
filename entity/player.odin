package entity

import rl "vendor:raylib"
import "core:fmt"
import "../lib"

Player :: struct {
    using entity: Entity,

    look: rl.Vector2,
    texture: rl.Texture2D,
    source, dest: rl.Rectangle,
}

update_player :: proc (dt: f32, self: ^Player) {
    
//    self.vel = 300 * lib.norm(self.vel)
//    self.pos += self.vel * dt

    self.look = rl.GetMousePosition() - self.pos

    self.dest.x = self.pos.x
    self.dest.y = self.pos.y
}

draw_player :: proc (self: ^Player) {
    rl.DrawTexturePro(self.texture, self.source, self.dest, {24, 29}, 90 + lib.toDeg(lib.dir(self.look)), rl.WHITE)
    fmt.println(lib.toDeg(lib.dir(self.look)))
}
