cmake_minimum_required(VERSION 3.10)

project(ExerciciosSeparados C)

set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)

# Diretório bin portátil - direto em bin/ sem subpastas
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin")

# Para geradores multi-config (Visual Studio), força todos os configs em bin/ direto
foreach(OUTPUTCONFIG ${CMAKE_CONFIGURATION_TYPES})
    string(TOUPPER ${OUTPUTCONFIG} OUTPUTCONFIG_UPPER)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_${OUTPUTCONFIG_UPPER} "${CMAKE_SOURCE_DIR}/bin")
endforeach()

file(MAKE_DIRECTORY "${CMAKE_SOURCE_DIR}/bin")

# Detecta todas as pastas Ex##_*
file(GLOB EXER_DIRS RELATIVE "${CMAKE_SOURCE_DIR}" "Ex[0-9][0-9]_*")

foreach(dir ${EXER_DIRS})
    if(IS_DIRECTORY "${CMAKE_SOURCE_DIR}/${dir}")
        if(EXISTS "${CMAKE_SOURCE_DIR}/${dir}/main.c")
            string(REGEX REPLACE "^Ex([0-9][0-9])_.*$" "ex\\1" target "${dir}")
            # If a target with this name was already created, skip to avoid duplicate-target errors
            if (TARGET ${target})
                message(WARNING "Skipping ${dir}: target '${target}' already exists (possible duplicate directory)")
            else()
                add_executable(${target} "${dir}/main.c")
                if(MSVC)
                    target_compile_options(${target} PRIVATE /W4 /utf-8)
                else()
                    target_compile_options(${target} PRIVATE -Wall -Wextra -g)
                endif()
            endif()
        endif()
    endif()
endforeach()
