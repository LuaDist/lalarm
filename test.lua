-- test alarm

function myalarm()
 print("in alarm!",os.date"%T",a,math.floor(100*a/N).."%")
 alarm(1)
end

N=4000000

print"hello"
alarm(1,myalarm)
a=0
for i=1,N do
 a=a+1
 math.sin(a)	-- waste some time...
end
print(a)
print"bye"
