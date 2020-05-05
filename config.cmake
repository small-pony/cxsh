string(TIMESTAMP buildTime "%Y%m%d-%H%M%S")

set(configFileName "${CMAKE_CURRENT_SOURCE_DIR}/cxsh/config.h")



file(WRITE ${configFileName} "\r\n#ifndef MAINCONFIG_H\r\n#define MAINCONFIG_H\r\n" )
file(APPEND ${configFileName} "const char* version=\"${Cxsh_VERSION_MAJOR}.${Cxsh_VERSION_MINOR}.${Cxsh_VERSION_PATCH}\";")
file(APPEND ${configFileName} "\r\nconst char* buildTime=\"${buildTime}\";")
file(APPEND ${configFileName} "\r\n#endif")