# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule mtdev_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("mtdev")
JLLWrappers.@generate_main_file("mtdev", UUID("009596ad-96f7-51b1-9f1b-5ce2d5e8a71e"))
end  # module mtdev_jll
