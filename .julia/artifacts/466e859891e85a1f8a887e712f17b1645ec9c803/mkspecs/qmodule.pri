host_build {
    QT_CPU_FEATURES.x86_64 = mmx sse sse2
} else {
    QT_CPU_FEATURES.x86_64 = mmx sse sse2
}
QT.global_private.enabled_features = reduce_exports x86intrin sse2 sse3 ssse3 sse4_1 sse4_2 avx f16c avx2 avx512f avx512er avx512cd avx512pf avx512dq avx512bw avx512vl avx512ifma avx512vbmi avx512vbmi2 aesni vaes rdrnd rdseed shani posix_fallocate alloca_h alloca system-zlib dbus gui network printsupport sql testlib widgets xml libudev openssl dlopen relocatable cross_compile largefile precompile_header enable_new_dtags sse2 sse3 ssse3 sse4_1 sse4_2 avx f16c avx2 avx512f avx512er avx512cd avx512pf avx512dq avx512bw avx512vl avx512ifma avx512vbmi avx512vbmi2 aesni vaes rdrnd rdseed shani
QT.global_private.disabled_features = use_bfd_linker use_gold_linker use_lld_linker use_mold_linker android-style-assets gc_binaries developer-build private_tests debug no_direct_extern_access mips_dsp mips_dspr2 neon arm_crc32 arm_crypto alloca_malloc_h stack-protector-strong stdlib-libcpp dbus-linked intelcet
CONFIG += cross_compile largefile precompile_header enable_new_dtags sse2 sse3 ssse3 sse4_1 sse4_2 avx f16c avx2 avx512f avx512er avx512cd avx512pf avx512dq avx512bw avx512vl avx512ifma avx512vbmi avx512vbmi2 aesni vaes rdrnd rdseed shani
PKG_CONFIG_EXECUTABLE = /usr/bin/pkg-config
QT_COORD_TYPE = double
QT_BUILD_PARTS = libs

QMAKE_LIBS_ZLIB = -L"/opt/x86_64-linux-gnu/x86_64-linux-gnu/sys-root/usr/local/lib" -lz
QMAKE_INCDIR_LIBUDEV = /workspace/destdir/include
QMAKE_LIBS_LIBUDEV = -L"/workspace/destdir/lib" -ludev
