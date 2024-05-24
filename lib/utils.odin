package lib

import rl "vendor:raylib"
import "core:math"

mag :: proc(v: rl.Vector2) -> f32 {
    return math.sqrt(v.x*v.x + v.y*v.y)
}

norm :: proc(v : rl.Vector2) -> rl.Vector2 {
    mag := mag(v)

    if mag == 0 {
        return rl.Vector2 {0, 0}
    } else {
        return rl.Vector2 {v.x / mag, v.y / mag}
    }
}

degrees :: proc(rad: f32) -> f32 {
    return rad * 57.296 // 180/pi value
}

dir :: proc(v: rl.Vector2) -> f32 {
    ang := math.atan2(v.y, v.x)

    if ang < 0 {
        ang += 6.28
    } return ang
}

angToCoord :: proc(dir: f32, mag: f32) -> rl.Vector2 {
    return rl.Vector2 { math.cos(dir) * mag, math.sin(dir) * mag}
}
