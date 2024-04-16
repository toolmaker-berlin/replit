# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule libevdev_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("libevdev")
JLLWrappers.@generate_main_file("libevdev", UUID("2db6ffa8-e38f-5e21-84af-90c45d0032cc"))
end  # module libevdev_jll
