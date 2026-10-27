ExternalProject_Add(duckdb
  GIT_REPOSITORY https://github.com/drrtuy/duckdb-engine
  GIT_TAG ac6886691fa2e07236b12d2d611f7985e0268f7b
  INSTALL_COMMAND ""
  CMAKE_ARGS ${CMAKE_ARGS}
)
