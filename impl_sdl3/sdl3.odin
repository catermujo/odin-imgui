package impl_sdl3

import im "../"
import "../../sdl"

when im.BACKEND_SDL3_ENABLED {
    when ODIN_ARCH == .wasm32 || ODIN_ARCH == .wasm64p32 {
        @(link_prefix = "ImGui_ImplSDL3_", default_calling_convention = "c")
        foreign _ {
            InitForOpenGL :: proc(window: ^sdl.Window, gl_ctx: rawptr) -> bool ---
            InitForMetal :: proc(window: ^sdl.Window) -> bool ---
            InitForVulkan :: proc(window: ^sdl.Window) -> bool ---
            InitForD3D :: proc(window: ^sdl.Window) -> bool ---
            InitForOther :: proc(window: ^sdl.Window) -> bool ---
            Shutdown :: proc() ---
            ProcessEvent :: proc(event: ^sdl.Event) -> bool ---
            NewFrame :: proc() ---
        }
    } else {
        @(link_prefix = "ImGui_ImplSDL3_", default_calling_convention = "c")
        foreign _ {
            InitForOpenGL :: proc(window: ^sdl.Window, gl_ctx: rawptr) -> bool ---
            InitForMetal :: proc(window: ^sdl.Window) -> bool ---
            InitForVulkan :: proc(window: ^sdl.Window) -> bool ---
            InitForD3D :: proc(window: ^sdl.Window) -> bool ---
            InitForOther :: proc(window: ^sdl.Window) -> bool ---
            Shutdown :: proc() ---
            ProcessEvent :: proc(event: ^sdl.Event) -> bool ---
            NewFrame :: proc() ---
        }
    }
}
