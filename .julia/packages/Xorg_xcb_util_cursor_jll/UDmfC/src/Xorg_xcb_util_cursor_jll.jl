# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule Xorg_xcb_util_cursor_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("Xorg_xcb_util_cursor")
JLLWrappers.@generate_main_file("Xorg_xcb_util_cursor", UUID("e920d4aa-a673-5f3a-b3d7-f755a4d47c43"))
end  # module Xorg_xcb_util_cursor_jll
