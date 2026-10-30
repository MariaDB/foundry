if (CMAKE_VERSION VERSION_LESS 3.18)
  return()
endif()
ExternalProject_Add(tidesdb
  GIT_REPOSITORY https://github.com/tidesdb/tidesql
  GIT_TAG v5.2.0 # https://github.com/tidesdb/tidesql/releases/tag/v5.2.0
  INSTALL_COMMAND ""
  CMAKE_ARGS ${CMAKE_ARGS}
)
