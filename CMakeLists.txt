cmake_minimum_required(VERSION 3.10)
project(ExerciciosSeparados C)

set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)

# Detecta todas as pastas Ex##_*
file(GLOB EXER_DIRS RELATIVE "${CMAKE_SOURCE_DIR}" "Ex[0-9][0-9]_*")

# Para cada pasta Ex##_Nome, cria um executável ex## compilando apenas main.c
foreach(dir ${EXER_DIRS})
    if(IS_DIRECTORY "${CMAKE_SOURCE_DIR}/${dir}")
        # Verifica se existe main.c
        if(EXISTS "${CMAKE_SOURCE_DIR}/${dir}/main.c")
            # Extrai o número (Ex01 -> ex01)
            string(REGEX REPLACE "^Ex([0-9][0-9])_.*$" "ex\\1" target "${dir}")
            
            # Cria o executável apenas com main.c
            add_executable(${target} "${dir}/main.c")
            
            # Flags específicas por plataforma
            if(MSVC)
                target_compile_options(${target} PRIVATE /W4 /utf-8)
            else()
                target_compile_options(${target} PRIVATE -Wall -Wextra -g)
            endif()
            
            # Define output directory
            set_target_properties(${target} PROPERTIES
                RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}"
            )
        endif()
    endif()
endforeach()
