# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule Qt6Base_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("Qt6Base")
JLLWrappers.@generate_main_file("Qt6Base", UUID("c0090381-4147-56d7-9ebc-da0b1113ec56"))
end  # module Qt6Base_jll
