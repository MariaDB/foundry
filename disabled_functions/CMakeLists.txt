ExternalProject_Add(disabled_functions
  GIT_REPOSITORY https://github.com/lefred/mariadb-plugin-disabled-functions
  GIT_TAG 842ca4b8a6ecaf54e4ccbf5e29c20dc6038c22cd
  INSTALL_COMMAND ""
  CMAKE_ARGS ${CMAKE_ARGS}
)
