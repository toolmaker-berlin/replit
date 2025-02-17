# Autogenerated wrapper script for FFMPEG_jll for i686-w64-mingw32
export ffmpeg, ffprobe, libavcodec, libavdevice, libavfilter, libavformat, libavresample, libavutil, libpostproc, libswresample, libswscale

using libass_jll
using libfdk_aac_jll
using FriBidi_jll
using FreeType2_jll
using LAME_jll
using libvorbis_jll
using libaom_jll
using Ogg_jll
using x264_jll
using x265_jll
using Bzip2_jll
using Zlib_jll
using OpenSSL_jll
using Opus_jll
using PCRE2_jll
JLLWrappers.@generate_wrapper_header("FFMPEG")
JLLWrappers.@declare_library_product(libavcodec, "avcodec-58.dll")
JLLWrappers.@declare_library_product(libavdevice, "avdevice-58.dll")
JLLWrappers.@declare_library_product(libavfilter, "avfilter-7.dll")
JLLWrappers.@declare_library_product(libavformat, "avformat-58.dll")
JLLWrappers.@declare_library_product(libavresample, "avresample-4.dll")
JLLWrappers.@declare_library_product(libavutil, "avutil-56.dll")
JLLWrappers.@declare_library_product(libpostproc, "postproc-55.dll")
JLLWrappers.@declare_library_product(libswresample, "swresample-3.dll")
JLLWrappers.@declare_library_product(libswscale, "swscale-5.dll")
JLLWrappers.@declare_executable_product(ffmpeg)
JLLWrappers.@declare_executable_product(ffprobe)
function __init__()
    JLLWrappers.@generate_init_header(libass_jll, libfdk_aac_jll, FriBidi_jll, FreeType2_jll, LAME_jll, libvorbis_jll, libaom_jll, Ogg_jll, x264_jll, x265_jll, Bzip2_jll, Zlib_jll, OpenSSL_jll, Opus_jll, PCRE2_jll)
    JLLWrappers.@init_library_product(
        libavcodec,
        "bin\\avcodec-58.dll",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_library_product(
        libavdevice,
        "bin\\avdevice-58.dll",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_library_product(
        libavfilter,
        "bin\\avfilter-7.dll",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_library_product(
        libavformat,
        "bin\\avformat-58.dll",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_library_product(
        libavresample,
        "bin\\avresample-4.dll",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_library_product(
        libavutil,
        "bin\\avutil-56.dll",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_library_product(
        libpostproc,
        "bin\\postproc-55.dll",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_library_product(
        libswresample,
        "bin\\swresample-3.dll",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_library_product(
        libswscale,
        "bin\\swscale-5.dll",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_executable_product(
        ffmpeg,
        "bin\\ffmpeg.exe",
    )

    JLLWrappers.@init_executable_product(
        ffprobe,
        "bin\\ffprobe.exe",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
