print("\033c") # Funktioniert


import REPL

function getc1()
    ret = ccall(:jl_tty_set_mode, Int32, (Ptr{Cvoid},Int32), stdin.handle, true)
    ret == 0 || error("unable to switch to raw mode")
    c = read(stdin, Char)
    ccall(:jl_tty_set_mode, Int32, (Ptr{Cvoid},Int32), stdin.handle, false)
    c
end



function quit()
    print("Press q to quit!");
    while true
        opt = getc1(); # error wenn c2
        if opt == 'q'
            break
        else
            if opt in "1234567890a"
            #println(typeof(opt))
            println(typeof(opt)," ",Int(opt))
            end
            continue
        end
    end
end
quit()

print("\033c") # Funktioniert

function choicex() # This little game for example
    n=1
    r=rand(1:9)
    while n != 0
        print("Guess an digit from 1 to 9 (0 to exit): ")
        n = parse(UInt8, readline())
        if n==r
            println("*****=======lucky find!=======*****")
            println("Play again...")
            r=rand(1:9)
        elseif n!=0
            println("Wrong,keep trying")
        end
    end
end
# choicex()


function wait_for_key( ;
    io_in::IO = stdin,
    io_out::IO = stdout,
    prompt::String = "press any key [d]raw [n]odraw [q]uit : ",
)

    print(io_out, prompt)

    t = REPL.TerminalMenus.terminal
    REPL.Terminals.raw!(t, true)
    char = read(io_in, Char) 
    REPL.Terminals.raw!(t, false)

    write(io_out, char)
    write(io_out, "\n")

    return char
end

wait_for_key()

print("\033c") # Funktioniert

str = Base.prompt("[Y] / N ? ") in ("","y","Y") ? "Y" : "N"

"""
           input(prompt::AbstractString="")::String

       Read a string from STDIN. The trailing newline is stripped.

       The prompt string, if given, is printed to standard output without a
       trailing newline before reading input.
"""

       function input(prompt::AbstractString="")::String
           print(prompt)
           return chomp(readline())
       end

x=input(raw"Zahlen eingeben:")
# x=parse(Int,input("Zahlen:"))


println(x)
bytesavailable(stdin)

