# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule libinput_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("libinput")
JLLWrappers.@generate_main_file("libinput", UUID("36db933b-70db-51c0-b978-0f229ee0e533"))
end  # module libinput_jll
