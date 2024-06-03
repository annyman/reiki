package entity

import rl "vendor:raylib"
import "core:fmt"
import "../lib"

Player :: struct {
    using entity: Entity,

    look: lib.Ray, // raycast mouse
    texture: rl.Texture2D, // wrap this later in animation
    source, dest: rl.Rectangle,
}

update_player :: proc (dt: f32, self: ^Player) {
    self.look = {self.pos, lib.dir(rl.GetMousePosition() - self.pos), 35, false}

    lib.attachRay(&self.look, self.pos)

    //if rl.IsKeyPressed(.W) { self.vel = 1 * lib.angToCoord(self.look.poynt, self.look.len) }
    move(self)

    self.dest.x = self.pos.x
    self.dest.y = self.pos.y

    self.pos += self.vel * dt
}

draw_player :: proc (self: ^Player, debug: bool) {
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
