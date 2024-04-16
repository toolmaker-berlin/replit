# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule gperf_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("gperf")
JLLWrappers.@generate_main_file("gperf", UUID("1a1c6b14-54f6-533d-8383-74cd7377aa70"))
end  # module gperf_jll
