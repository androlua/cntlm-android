export NDK=/home/jer/Projet_android/android-ndk-r5
export TOOLCHAIN=/home/jer/standalone-toolchain
export AOSP=/home/jer/cm7
export PRODUCT=vision
export PATH=$TOOLCHAIN/bin/:$PATH

export CC=arm-linux-androideabi-gcc
export CFLAGS="-march=armv7-a -mfloat-abi=softfp"
export CPPFLAGS=$CFLAGS
export LDFLAGS="-Wl,--fix-cortex-a8 -lsupc++ -L$AOSP/out/target/product/$PRODUCT/system/lib"
export LIBS="$TOOLCHAIN/arm-linux-androideabi/lib/libstdc++.a"

rm -rf $TOOLCHAIN
$NDK/build/tools/make-standalone-toolchain.sh --platform=android-9 --install-dir=$TOOLCHAIN

# Configure using host parameters (cross compilation not supported)
./configure
make -f Makefile.android
arm-linux-androideabi-strip cntlm
