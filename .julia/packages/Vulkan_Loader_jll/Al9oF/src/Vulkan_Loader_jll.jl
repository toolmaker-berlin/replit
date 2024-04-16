# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule Vulkan_Loader_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("Vulkan_Loader")
JLLWrappers.@generate_main_file("Vulkan_Loader", UUID("a44049a8-05dd-5a78-86c9-5fde0876e88c"))
end  # module Vulkan_Loader_jll
