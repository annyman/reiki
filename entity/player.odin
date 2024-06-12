package entity

import rl "vendor:raylib"
import "core:fmt"
import "../lib"

player_states :: enum { Idle, Death, Ascend } // TODO: animation system

Player :: struct {
    using entity: Entity,
    look: lib.Ray, // raycast mouse
    ammo: [200]Bullet, // TODO: make object pooling quesiton mark ?
    state: player_states,
}

load_player :: proc(self: ^Player) {
    self.look = { self.pos, 0.0, 20, false }
    gen_bullet(self)
}

update_player :: proc (dt: f32, self: ^Player) {
    self.look.poynt = lib.dir(rl.GetMousePosition() - self.pos)
    lib.attach_ray(&self.look, self.pos)

    move(self)
    lib.play(dt, &self.reel[self.state])

    if rl.IsMouseButtonPressed(.LEFT) {
        fire_bullet(self)
    }

    for &bullet in self.ammo {
        if bullet.lifetime != false { update(dt, &bullet) }
    }

    self.dest.x = self.pos.x
    self.dest.y = self.pos.y
    self.source.x = f32(self.reel[self.state].cell * self.reel[self.state].current)

    self.pos += self.vel * dt
}

draw_player :: proc (self: ^Player, debug: bool) {

    for &bullet in self.ammo {
        if bullet.lifetime != false { draw(&bullet, debug) }
    }

    rl.DrawTexturePro(self.reel[self.state].texture, self.source, self.dest, self.size/2, 90 + lib.degrees(self.look.poynt), rl.WHITE)

    if debug == true {
        lib.debug_ray(&self.look)
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

    for &b in self.ammo {
        if b.lifetime != false {
            b.pos = self.pos
            b.vel = lib.angToCoord(self.look.poynt, 300)
            b.dir = self.look.poynt
            b.lifetime = true
            break
        }
    }
}
