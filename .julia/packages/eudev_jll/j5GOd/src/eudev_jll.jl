# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule eudev_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("eudev")
JLLWrappers.@generate_main_file("eudev", UUID("35ca27e7-8b34-5b7f-bca9-bdc33f59eb06"))
end  # module eudev_jll
