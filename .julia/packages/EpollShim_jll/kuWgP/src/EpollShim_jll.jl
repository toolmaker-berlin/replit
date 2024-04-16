# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule EpollShim_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("EpollShim")
JLLWrappers.@generate_main_file("EpollShim", UUID("2702e6a9-849d-5ed8-8c21-79e8b8f9ee43"))
end  # module EpollShim_jll
