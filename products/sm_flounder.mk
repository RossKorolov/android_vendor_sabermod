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
TARGET_SM_KERNEL := 5.1
TARGET_SM_AND := 4.9
TARGET_ARCH := arm64
LOCAL_ARCH := arm64
FLOUNDER_THREADS:= 2
PRODUCT_THREADS := $(FLOUNDER_THREADS)

GRAPHITE_KERNEL_FLAGS := \
  -floop-parallelize-all \
  -ftree-parallelize-loops=$(PRODUCT_THREADS) \
  -fopenmp

# Do not enable pthread when OpenMP is set to handle threads
export ENABLE_PTHREAD := false

# Extra SaberMod GCC C flags for arch target and Kernel
export EXTRA_SABERMOD_GCC_VECTORIZE_CFLAGS := \
  -ftree-vectorize
