#include "TcpSocket.h"
#include "HttpRequest.h"

#include "Mem.h"

#include "Abbreviations.h"

#include "catch_amalgamated.hpp"

#include <iostream>

// ------------------------------------------
bool g_recoveryMode = false;
int g_inMemcpy=0;
int32_t g_recoveryLevel = 0;

bool sendPageSEO(TcpSocket *s, HttpRequest *hr) {
        return false; }
// ------------------------------------------

TEST_CASE( "isAbbr('lang') is an abbreviation and has no word after", "[isAbbr]" ) {
    bool hasWordAfter = true;
    REQUIRE( isAbbr( hash64Lower_utf8("lang"), &hasWordAfter ) == true );
    REQUIRE( hasWordAfter == false );
}

TEST_CASE( "isAbbr('vs') is an abbreviation and has a word after", "[isAbbr]" ) {
    bool hasWordAfter = false;
    REQUIRE( isAbbr( hash64Lower_utf8("vs"), &hasWordAfter ) == true );
    REQUIRE( hasWordAfter == true );
}

TEST_CASE( "isAbbr('xyz') is not an abbreviation", "[isAbbr]" ) {
    REQUIRE( isAbbr( hash64Lower_utf8("xyz") ) == false );
}

int main( int argc, char* argv[] ) {
  g_conf.m_runAsDaemon = false;
  g_conf.m_logToFile = false;
  char stackPointTestAnchor;
  g_mem.setStackPointer( &stackPointTestAnchor );
  g_mem.m_memtablesize = 2048;
  hashinit();

  int result = Catch::Session().run( argc, argv );

  return result;
}
