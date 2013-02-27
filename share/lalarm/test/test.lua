-- test alarm

require"alarm"

version="alarm library for ".. _VERSION.." / May 2009"

------------------------------------------------------------------------------
print(version)

------------------------------------------------------------------------------
print""
print"timeout..."

function timeout(t,f,...)
	alarm(t,function () error"timeout!" end)
	print(pcall(f,...))
	alarm()
end

timeout(1,function (N) for i=1,N do end return "ok",N end,1e6)
timeout(1,function (N) for i=1,N do end return "ok",N end,1e8)

------------------------------------------------------------------------------
print""
print"timer..."

function timer(s,f)
	local a=function () f() alarm(s) end
	alarm(s,a)
end

function myalarm()
	print("in alarm!",os.date"%T",a,math.floor(100*a/N).."%")
end

N=2e7
timer(1,myalarm)
a=0
print("start   ",os.date"%T",a,math.floor(100*a/N).."%")
for i=1,N do
 a=a+1
 math.sin(a)	-- waste some time...
end
print("finish  ",os.date"%T",a,math.floor(100*a/N).."%")

------------------------------------------------------------------------------
print""
print(version)
