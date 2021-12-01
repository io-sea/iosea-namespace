cmake_minimum_required(VERSION 2.6.4)
cmake_policy(SET CMP0017 NEW)

SET(WITHIN_IOSEA_NAMESPACE_REPO TRUE)
PROJECT(libiosea-hash C)
set(IOSEA-NAMESPACE_MAJOR_VERSION 1)
set(IOSEA-NAMESPACE_MINOR_VERSION 3)
set(IOSEA-NAMESPACE_PATCH_LEVEL 0)
set(IOSEA-NAMESPACE_EXTRA_VERSION "")

include_directories(AFTER libm0common
			  libiosea-hash/include
                          kvsal/include
			  extstore/include
			  kvsns-base/include)

add_subdirectory(libiosea-hash)
add_subdirectory(libm0common)
add_subdirectory(kvsal)
add_subdirectory(extstore)
add_subdirectory(kvsns-base)
