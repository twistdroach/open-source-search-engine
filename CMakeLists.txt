cmake_minimum_required(VERSION 3.20)
project(open-source-search-engine)

file(GLOB SRC_FILES "src/*.cpp" "src/*.c" "src/*.h")
list(REMOVE_ITEM SRC_FILES ${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp)

set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)

add_compile_definitions(PTHREADS _REENTRANT_ _CHECK_FORMAT_STRING_)
add_compile_options(-Wall -Wno-write-strings -Wstrict-aliasing=0 -Wno-uninitialized -Wno-unused-but-set-variable)
#add_compile_options(-Wall -Wextra -Wpedantic)

find_package(OpenSSL REQUIRED)
find_package(ZLIB REQUIRED)
find_package(Iconv REQUIRED)

add_library(osse STATIC ${SRC_FILES})
target_link_libraries(osse OpenSSL::SSL ZLIB::ZLIB Iconv::Iconv)

add_executable(gb src/main.cpp)
target_link_libraries(gb osse)

install(TARGETS gb DESTINATION .)
install(DIRECTORY ucdata antiword-dir html DESTINATION .)
set(INSTALL_FILES 
  catcountry.dat badcattable.dat antiword pdftohtml pstotext 
  gb.pem bmptopnm giftopnm jpegtopnm libjpeg.so.62 libnetpbm.so.10
  libpng12.so.0 libtiff.so.4 LICENSE pngtopnm pnmscale ppmtojpeg 
  tifftopnm mysynonyms.txt wikititles.txt.part1 wikititles.txt.part2
  wiktionary-buf.txt wiktionary-lang.txt wiktionary-syns.dat
  sitelinks.txt unifiedDict.txt
)
install(FILES ${INSTALL_FILES} DESTINATION .)

include(CTest)
add_subdirectory(test)
