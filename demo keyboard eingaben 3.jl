print("\033c") # cls

#println(displaysize(stdout))

lines=displaysize(stdout)[1]
columes=displaysize(stdout)[2]

for i in 1:30#lines
  println("... ",i)
end

for i in 1:columes
  #print('0'+i%10)
end

using Crayons
print("\033[3;5H")
println(crayon"red","Test!" )
# println(Crayon(reset=true))
function getc1()
    ret = ccall(:jl_tty_set_mode, Int32, (Ptr{Cvoid},Int32), stdin.handle, true)
    ret == 0 || error("unable to switch to raw mode")
    c = read(stdin, Char)
    ccall(:jl_tty_set_mode, Int32, (Ptr{Cvoid},Int32), stdin.handle, false)
    c
end


function quit()
    println("Press q to quit!")
    for i in 1:columes
      print('0'+i%10)
    end
    println()
  
    while true
        opt = getc1(); # error wenn c2
        println("xx ",bytesavailable(stdin))
        if opt == 'q'
            println(displaysize(stdout))
            break
        else
            if opt in "1234567890"
            #println(typeof(opt))
            else
                println(typeof(opt)," ",Int(opt))
            end
            continue
        end
    end
end
quit()
