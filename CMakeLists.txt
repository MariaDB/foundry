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
cmake_minimum_required(VERSION 3.12)
project(Foundry LANGUAGES NONE)

include(ExternalProject)

set(f ${DIR}/CMakeLists.txt)

if(NOT EXISTS ${f})
  message(FATAL_ERROR "No ${f} exists")
endif()

SET(CMAKE_ARGS -DCPACK_PACKAGE_DIRECTORY=${CMAKE_CURRENT_BINARY_DIR})
foreach(var RPM DEB CMAKE_PREFIX_PATH)
  set(CMAKE_ARGS ${CMAKE_ARGS} "-D${var}=${${var}}")
endforeach()

add_subdirectory(${DIR})

get_property(t DIRECTORY ${DIR} PROPERTY BUILDSYSTEM_TARGETS)
ExternalProject_Get_Property(${t} BINARY_DIR)

add_custom_target(package
  COMMAND ${CMAKE_COMMAND} --build ${BINARY_DIR} --target package
  DEPENDS ${t}
)
