string(TIMESTAMP buildTime "%Y%m%d-%H%M%S")

set(configFileName "${CMAKE_CURRENT_SOURCE_DIR}/cxsh/config.h")



file(WRITE ${configFileName} "\r\n#pragma once\r\n" )
file(APPEND ${configFileName} "static const char* cxshVersion=\"${Cxsh_VERSION_MAJOR}.${Cxsh_VERSION_MINOR}.${Cxsh_VERSION_PATCH}\";")
file(APPEND ${configFileName} "\r\nstatic const char* cxshBuildTime=\"${buildTime}\";")