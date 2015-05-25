# Copyright (C) 2015 The SaberMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

O3_OPTIMIZATIONS := true
TARGET_SM_KERNEL := 6.0
TARGET_SM_AND := 4.9
TARGET_ARCH := arm
LOCAL_ARCH := arm
JFLTE_THREADS := 4
PRODUCT_THREADS := $(JFLTE_THREADS)

GRAPHITE_KERNEL_FLAGS := \
  -floop-parallelize-all \
  -ftree-parallelize-loops=$(PRODUCT_THREADS) \
  -fopenmp

GRAPHITE_FLAGS := \
  -floop-parallelize-all \
  -ftree-parallelize-loops=$(PRODUCT_THREADS)

LOCAL_DISABLE_GRAPHITE += \
  libpdfiumcore \
  libc_netbsd \
  libncurses 

# Do not enable pthread when graphite flags are set to handle threads
export ENABLE_PTHREAD := false

# Extra SaberMod GCC C flags for arch target and Kernel
export EXTRA_SABERMOD_GCC_VECTORIZE_CFLAGS := \
  -ftree-vectorize \
  -mvectorize-with-neon-quad

# Enable strict aliasing optimizations
export ENABLE_STRICT_ALIASING := false

ifeq ($(strip $(ENABLE_STRICT_ALIASING)),true)
  LOCAL_DISABLE_STRICT_ALIASING := \
    libstlport_static \
    libcrypto_static \
    gatt_testtool \
    libssh \
    mm-vdec-omx-test \
    ssh \
    libsurfaceflinger \
    audio.primary.msm8960 \
    lsof \
    tcpdump
endif
