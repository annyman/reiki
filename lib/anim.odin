package lib

import rl "vendor:raylib"
import "../lib"

Anim :: struct {
	texture: rl.Texture2D,
	cell: int,
	frames: int,
	current: int,
	timer: Timer,
	loop: bool,
}

play :: proc(dt: f32, self: ^Anim) {
	timer_update(dt, &self.timer)

	if timer_done(&self.timer) {
		self.current += 1

		if self.current == self.frames - 1 && self.loop {
			self.current = 0
		}
	}
}
