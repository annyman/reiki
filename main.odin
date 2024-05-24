package game

import rl "vendor:raylib"
import "entity"
import "lib"

scrHeight :: 700
scrWidth :: 700
pixelGrids :: 180

main :: proc() {
    rl.InitWindow(scrWidth, scrHeight, "DOT shoot em up")
    rl.SetWindowState({.VSYNC_HINT}) // Enable VSYNC
    rl.SetExitKey(.Q)

    plr := entity.Player {
        { {400, 400}, {0, 0}, {48, 58} },
        0.0,
        rl.LoadTexture("assets/img/player_1.png"),
        {0, 0, 48, 58}, {0, 0, 48, 58}
    }

    for !rl.WindowShouldClose() {
        dt := rl.GetFrameTime()

        rl.BeginDrawing()
        rl.ClearBackground(rl.DARKGRAY)

        entity.update(dt, &plr)

        entity.draw(&plr)

        rl.DrawFPS(10, 10)
        rl.EndDrawing()
    }

    rl.CloseWindow()
}
