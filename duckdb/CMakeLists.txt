ExternalProject_Add(duckdb
  GIT_REPOSITORY https://github.com/drrtuy/duckdb-engine
  GIT_TAG a388e0f5c6e27d4beaad04e6de5b6ca27065b1a7
  INSTALL_COMMAND ""
  CMAKE_ARGS ${CMAKE_ARGS}
)
