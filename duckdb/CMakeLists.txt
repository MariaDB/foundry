ExternalProject_Add(duckdb
  GIT_REPOSITORY https://github.com/drrtuy/duckdb-engine
  GIT_TAG 9692df5b17f5d0b4e4ae9d9bf93fd29f3771c978
  INSTALL_COMMAND ""
  CMAKE_ARGS ${CMAKE_ARGS}
)
