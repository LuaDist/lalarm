/*
* lalarm.c -- an alarm library for Lua
*/

#include <signal.h>
#include <unistd.h>

#include "lua.h"
#include "luadebug.h"

#define NAME	"_ALARM"

static lua_State *LL = NULL;
static lua_Hook linehook = NULL;
static lua_Hook callhook = NULL;

static void l_handler(lua_State *L, lua_Debug *ar)
{
 L=LL;
 lua_setlinehook(L,linehook);
 lua_setcallhook(L,callhook);
 lua_pushstring(L,NAME);
 lua_gettable(L,LUA_REGISTRYINDEX);
 if (lua_isfunction(L,-1))
  lua_call(L,0,0);
 else
  lua_error(L,"bad alarm handler");
}

static void l_signal(int i)
{						/* assert(i==SIGALRM); */
 signal(i,SIG_DFL);
 linehook = lua_setlinehook(LL,l_handler);
 callhook = lua_setcallhook(LL,l_handler);
}

static int l_alarm(lua_State *L) 		/* alarm(secs,[func]) */
{
 LL=L;
 if (lua_gettop(L)>1)
 {
  lua_pushstring(L,NAME);
  lua_pushvalue(L,2);
  lua_settable(L,LUA_REGISTRYINDEX);
 }
 if (signal(SIGALRM,l_signal)==SIG_ERR)
  lua_pushnil(L);
 else
  lua_pushnumber(L,alarm(lua_tonumber(L,1)));
 return 1;
}

int lua_lalarmopen(lua_State *L)
{
 lua_register(L,"alarm",l_alarm);
 return 0;
}
