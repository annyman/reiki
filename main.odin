package game

import rl "vendor:raylib"

scrHeight :: 720
scrWidth :: 1280
pixelGrids :: 180

main :: proc() {
    rl.InitWindow(scrWidth, scrHeight, "Bunny Blaster")
    rl.SetWindowState({.VSYNC_HINT}) // Enable VSYNC

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
