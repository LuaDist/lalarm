if os~=nil then
 date = os.date
 floor = math.floor
 sin = math.sin
end

function myalarm()
 print("in alarm!",date"%T",a,floor(100*a/N).."%")
 alarm(1)
end

N=1000000
N=2000000
N=3000000
N=4000000

print"hello"
a=0
alarm(1,myalarm)
for i=1,N do
 a=a+1
--[[
 sin(a)
--]]
end
print(a)
print"bye"
