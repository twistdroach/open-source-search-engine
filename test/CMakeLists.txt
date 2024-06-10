find_package(Catch2 3 REQUIRED)
include_directories( ${CMAKE_SOURCE_DIR}/src )

add_executable(Abbreviations src/Abbreviations.cpp)
target_link_libraries(Abbreviations PRIVATE Catch2::Catch2 osse)

include(Catch)
catch_discover_tests(Abbreviations)
