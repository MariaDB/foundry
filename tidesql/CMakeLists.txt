ExternalProject_Add(tidesdb
  GIT_REPOSITORY https://github.com/tidesdb/tidesql
  GIT_TAG v5.1.1 # https://github.com/tidesdb/tidesql/releases/tag/v5.1.1
  INSTALL_COMMAND ""
  CMAKE_ARGS ${CMAKE_ARGS}
)
