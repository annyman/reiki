package lib
import "core:math"

mag :: proc(v: rl.Vector2) -> f32 {
    return math.sqrt(v.x) + math.sqrt(v.y)
}

dir :: proc(v: rl.Vector2) -> f32 {
    return math.arctan(v.y / v.x)
}