# makefile for lalarm

# change this to reflect your installation
LUA=/tmp/lua-4.0
LUAINC= $(LUA)/include
LUALIB= $(LUA)/lib
LUABIN= $(LUA)/bin
LUA_C= $(LUA)/src/lua/lua.c

# change this to reflect your installation
LUA=/l/lua
LUAINC= /l/lua
LUALIB= /l/lua
LUABIN= /l/lua
LUA_C= /l/lua/lua.c

# not need to change anything below here

CFLAGS= $(INCS) $(DEFS) $(WARN) -O2 #-g
WARN= -ansi -pedantic -Wall #-Wmissing-prototypes

INCS= -I$(LUAINC) -I.
LIBS= -L$(LUALIB) -llua -llualib -lm -ldl

OBJS= lua.o lalarm.o

T=a.out

all:	test

$T:	$(OBJS)
	$(CC) -o $@ $(OBJS) $(LIBS)

test:	$T
	$T test.lua

lua.c:	$(LUA_C)
	sed '/dblib/s/$$/ lua_lalarmopen(L);/' <$? >$@

clean:
	rm -f $(OBJS) $T lua.c core a.out

# distribution

D=alarm
A=$D.tar.gz
TOTAR=Makefile,README,lalarm.c,test.lua

tar:	clean
	tar zcvf $A -C .. $D/{$(TOTAR)}

distr:	tar
	mv $A ftp

diff:
	tar zxf ftp/$A
	diff . $D
