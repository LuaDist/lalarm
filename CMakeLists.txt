# Copyright (C) 2007-2009 LuaDist.
# Submitted by David Manura
# Redistribution and use of this file is allowed according to the terms of the MIT license.
# For details see the COPYRIGHT file distributed with LuaDist.
# Please note that the package source code is licensed under its own license.b

PROJECT(lalarm C)
CMAKE_MINIMUM_REQUIRED(VERSION 2.6)
INCLUDE(dist.cmake)

ADD_LUA_MODULE(alarm lalarm.c)
ADD_LUA_TEST(test.lua)

INSTALL (TARGETS alarm DESTINATION ${INSTALL_CMOD})
INSTALL (FILES test.lua DESTINATION ${INSTALL_TEST})
INSTALL (FILES README DESTINATION ${INSTALL_DATA})
