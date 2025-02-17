!host_build {
    QMAKE_CFLAGS    += --sysroot=$$[QT_SYSROOT]
    QMAKE_CXXFLAGS  += --sysroot=$$[QT_SYSROOT]
    QMAKE_LFLAGS    += --sysroot=$$[QT_SYSROOT]
}
host_build {
    QT_ARCH = x86_64
    QT_BUILDABI = x86_64-little_endian-lp64
    QT_TARGET_ARCH = x86_64
    QT_TARGET_BUILDABI = x86_64-little_endian-lp64
} else {
    QT_ARCH = x86_64
    QT_BUILDABI = x86_64-little_endian-lp64
    QT_LIBCPP_ABI_TAG = 
}
QT.global.enabled_features = shared cross_compile pkg-config rpath c++11 c++14 c++17 c++1z c99 c11 reduce_relocations signaling_nan thread future concurrent dbus openssl-linked opensslv30 shared cross_compile shared rpath c++11 c++14 c++17 c++1z reduce_exports reduce_relocations openssl
QT.global.disabled_features = static debug_and_release separate_debug_info appstore-compliant simulator_and_device force_asserts framework c++20 c++2a c++2b c++2b wasm-simd128 wasm-exceptions zstd opensslv11
QT.global.disabled_features += release build_all
QT_CONFIG += shared rpath c++11 c++14 c++17 c++1z reduce_exports reduce_relocations openssl release
CONFIG += release  shared cross_compile plugin_manifest
QT_VERSION = 6.5.3
QT_MAJOR_VERSION = 6
QT_MINOR_VERSION = 5
QT_PATCH_VERSION = 3

QT_GCC_MAJOR_VERSION = 10
QT_GCC_MINOR_VERSION = 2
QT_GCC_PATCH_VERSION = 0
QT_EDITION = Open Source
