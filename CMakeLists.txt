# CMakeList.txt: 顶层 CMake 项目文件，在此处执行全局配置
# 并包含子项目。
#
cmake_minimum_required (VERSION 3.8)


set(Cxsh_VERSION_MAJOR 1)
set(Cxsh_VERSION_MINOR 0)
set(Cxsh_VERSION_PATCH 0)

include(config.cmake)

project ("cxsh")

# 包含子项目。
add_subdirectory ("cxsh")

include(InstallRequiredSystemLibraries)

set (CPACK_RESOURCE_FILE_LICENSE
  "${CMAKE_CURRENT_SOURCE_DIR}/License.txt")
set (CPACK_PACKAGE_VERSION_MAJOR "${Cxsh_VERSION_MAJOR}")
set (CPACK_PACKAGE_VERSION_MINOR "${Cxsh_VERSION_MINOR}")
set (CPACK_PACKAGE_VERSION_PATCH "${Cxsh_VERSION_PATCH}")

include(CPack)

