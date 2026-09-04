# Copyright (c) 2026, MariaDB plc
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 2 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1335 USA

###
### Iterate command line, skip up to dir name arguments, build plugins
###
math(EXPR last "${CMAKE_ARGC} - 1")
set(skip TRUE)
foreach(i RANGE 0 ${last})
  set(f "${CMAKE_ARGV${i}}")
  if (f MATCHES "^-D") # collect -Dxxx=yyy build parameters
    set(param ${param} ${f})
    continue()
  elseif (f STREQUAL "-P") # ok, dir name arguments after that
    set(skip FALSE)
    message(STATUS "Build params:${param}")
    continue()
  elseif (skip OR f MATCHES "\\.[^/]*$") # skip files with extensions
    continue()
  endif()
  message(STATUS "Building ${f}")
  get_filename_component(b "${f}.build" NAME)
  file(MAKE_DIRECTORY "${b}")
  execute_process(COMMAND ${CMAKE_COMMAND} -S ${CMAKE_CURRENT_LIST_DIR} -DDIR=${f} -B "${b}" ${param} RESULT_VARIABLE err)
  if (NOT err)
    execute_process(COMMAND ${CMAKE_COMMAND} --build "${b}" --parallel --target package RESULT_VARIABLE err)
  endif()
  if (NOT err)
    file(GLOB packages "${b}/*.rpm" "${b}/*.deb" "${b}/*.tar.gz")
    if (NOT packages)
      set(err "No packages found")
    else()
      file(COPY ${packages} DESTINATION "${b}/..")
    endif()
  endif()
  if (err)
    message(SEND_ERROR "Plugin ${f} failed: ${err}")
  endif()
endforeach()
