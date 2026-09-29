ExternalProject_Add(levenshtein
  GIT_REPOSITORY https://github.com/lefred/mariadb-plugin-levenshtein
  GIT_TAG 791939dee860ba01a883c9d8b66f1338ded220b7
  INSTALL_COMMAND ""
  CMAKE_ARGS ${CMAKE_ARGS}
)
