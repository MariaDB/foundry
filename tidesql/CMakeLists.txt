ExternalProject_Add(tidesdb
  GIT_REPOSITORY https://github.com/tidesdb/tidesql
  GIT_TAG 5.0.0
  INSTALL_COMMAND ""
  CMAKE_ARGS ${CMAKE_ARGS}
)
