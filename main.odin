package game

import rl "vendor:raylib"
import "entity"
import "lib"

scrHeight :: 600
scrWidth :: 600
pixelGrids :: 180

main :: proc() {
    rl.InitWindow(scrWidth, scrHeight, "DOT shoot em up")
    rl.SetWindowState({.VSYNC_HINT}) // Enable VSYNC
    rl.SetExitKey(.Q)
    debug: bool = false

    plr := entity.Player {
        { {400, 400}, {0, 0}, {32, 32},
        {{
            rl.LoadTexture("assets/img/player/idle.png"),
            32,
            4,
            0,
            lib.Timer {0.0, 0.2},
            true,
        },
        {
            rl.LoadTexture("assets/img/player/death.png"),
            32,
            8,
            0,
            lib.Timer {0.0, 0.4},
            false,
        },
        {
            rl.LoadTexture("assets/img/player/ascend.png"),
            32,
            12,
            0,
            lib.Timer {0.0, 0.6},
            false,
        }},
        {0, 0, 32, 32}, {0, 0, 32, 32} }, // entity declaration
        lib.Ray { {0, 0}, 0, 0, false },
        {}, entity.player_states.Idle,
    }

    entity.load(&plr)

    for !rl.WindowShouldClose() {

        if rl.IsKeyPressed(.T) {
            debug = !debug
        }

        dt := rl.GetFrameTime()

        rl.BeginDrawing()
        rl.ClearBackground(rl.DARKGRAY)

        entity.update(dt, &plr)

        entity.draw(&plr, debug)

        rl.DrawFPS(10, 10)
        rl.EndDrawing()
    }

    rl.CloseWindow()
}
