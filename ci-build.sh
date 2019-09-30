#!/bin/bash
set -e
sourcedir="$PWD"
# install dependencies
#sudo apt update
#sudo apt install git cmake ninja-build clang python uuid-dev libicu-dev icu-devtools libbsd-dev libedit-dev libxml2-dev libsqlite3-dev swig libpython-dev libncurses5-dev pkg-config libblocksruntime-dev libcurl4-openssl-dev systemtap-sdt-dev tzdata rsync
# install the WASI sdk
#wget -O wasisdk.deb "https://github.com/swiftwasm/wasi-sdk/releases/download/20190421.6/wasi-sdk_3.19gefb17cb478f9.m_amd64.deb"
#sudo dpkg -i wasisdk.deb
# download ICU
#wget -O icu.tar.xz "https://github.com/swiftwasm/icu4c-wasi/releases/download/20190421.3/icu4c-wasi.tar.xz"
#tar xf icu.tar.xz
# start build
cd swift
utils/build-script --debug --wasm \
	--llvm-targets-to-build "X86;WebAssembly" \
	--wasm-wasi-sdk "/opt/wasi-sdk" \
	--wasm-icu-uc "todo" \
	--wasm-icu-uc-include "$sourcedir/icu_out/include" \
	--wasm-icu-i18n "todo" \
	--wasm-icu-i18n-include "todo" \
	--wasm-icu-data "todo" \
	--build-swift-static-stdlib \
	--install-swift \
	--install-prefix="/opt/swiftwasm-sdk" \
	--install-destdir="$sourcedir/install" \
	--installable-package="$sourcedir/swiftwasm.tar.gz"
# copy the result
cp "$sourcedir/swiftwasm.tar.gz" "$BUILD_ARTIFACTSTAGINGDIRECTORY/"

