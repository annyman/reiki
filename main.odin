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

    plr := entity.Player {
        { {0, 0}, {0, 0}, {48, 58} },
        0.0,
        rl.LoadTexture("assets/img/player_1.png"),
        {0, 0, 0, 0}, {0, 0, 0, 0}
    }

    for !rl.WindowShouldClose() {
        rl.BeginDrawing()
        rl.ClearBackground(rl.DARKGRAY)

        if rl.IsKeyDown(.Q) {
            break // Close window
        }

        rl.DrawFPS(10, 10)
        rl.EndDrawing()
    }
}
