package impl_sdl3

import im "../"
import "../../sdl"

IMGUI :: im.IMGUI

when IMGUI && im.BACKEND_SDL3_ENABLED {
    when ODIN_ARCH == .wasm32 || ODIN_ARCH == .wasm64p32 {
        @(link_prefix = "ImGui_ImplSDL3_", default_calling_convention = "c")
        foreign _ {
            InitForOpenGL :: proc(window: ^sdl.Window, gl_ctx: rawptr) -> bool ---
            InitForVulkan :: proc(window: ^sdl.Window) -> bool ---
            Shutdown :: proc() ---
            ProcessEvent :: proc(event: ^sdl.Event) -> bool ---
            NewFrame :: proc() ---
        }
    } else {
        when ODIN_OS == .Windows {
            when ODIN_ARCH == .amd64 {
                foreign import lib "../imgui_windows_x64.lib"
            } else {
                foreign import lib "../imgui_windows_arm64.lib"
            }
        } else when ODIN_OS == .Linux {
            when ODIN_ARCH == .amd64 {
                foreign import lib "../imgui_linux_x64.a"
            } else {
                foreign import lib "../imgui_linux_arm64.a"
            }
        } else when ODIN_OS == .Darwin {
            when ODIN_ARCH == .amd64 {
                foreign import lib "../imgui_darwin_x64.a"
            } else {
                foreign import lib "../imgui_darwin_arm64.a"
            }
        }

        @(link_prefix = "ImGui_ImplSDL3_", default_calling_convention = "c")
        foreign lib {
            InitForOpenGL :: proc(window: ^sdl.Window, gl_ctx: rawptr) -> bool ---
            InitForVulkan :: proc(window: ^sdl.Window) -> bool ---
            Shutdown :: proc() ---
            ProcessEvent :: proc(event: ^sdl.Event) -> bool ---
            NewFrame :: proc() ---
        }
    }
}

