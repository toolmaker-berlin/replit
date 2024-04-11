###module RomioCC

###greet() = print("Hello World!")
using Pkg
Pkg.activate(".")


using Debugger
using BenchmarkTools
using OhMyREPL


try
	using Revise
catch e
	@warn "Error initializing Revise" exception=(e, catch_backtrace())
end


macro ll()
	names(Main)
end

macro qq()
	exit()
end

macro list()
	names(Main)
end


macro ed(na)
	# quote
    return :( edit($na); includet($na); println("...reloaded!") )
	# end
end

macro config()
	quote
		# wegen CC deaktiviert #run(`nvim /Users/user/.julia/config/startup.jl`)
        println("...config in CC deaktiviert!")
		# includet("/Users/user/.julia/config/startup.jl")
	end
end

#println("Julia files ...")

#run(`exa `;wait=true)

function listfiles()
    println(pwd())
	xdir=readdir()
	for na in xdir
		if endswith(na,".jl") || endswith(na,".py") || endswith(na,".c") || endswith(na,".toml")
			println(na)
		end
	end
end
listfiles()

macro ls()
	quote
		#@edit xxx()
		#include("startjulia.jl")
		#println("in Arbeit!")
		listfiles()
	end
end

function incfiles()
    println(pwd())
    xdir=readdir()
	for na in xdir
		if endswith(na,".jl") #|| endswith(na,".py") || endswith(na,".c") || endswith(na,".toml")
			includet(na)
		end
	end
end

macro load()
	quote
		#@edit xxx()
		#include("startjulia.jl")
		#println("in Arbeit!")
		incfiles()
	end
end

using ReplMaker 


function romio(str)
    if str == "qq"
        str="@qq"
    end
    if str == "ll"
        str="@ll"
    end
    if str == "list"
        str="@list"
    end
    if str == "ls"
        str="@ls"
    end
    if str == "config"
        str="@config"
    end
    if str == "cf"
        str="@config"
    end
    #Meta.parse(replace(str, r"[\+\-]?\d+(?:\.\d+)?(?:[ef][\+\-]?\d+)?" => x -> "big\"$x\""))
    return Meta.parse(str)
end

atreplinit() do repl
    try
        @eval using ReplMaker
        @async initrepl(
                romio, 
                prompt_text="ccR> ",
                prompt_color = :magenta, 
                start_key='>', 
                mode_name="Romio (v:0.1)"
                )
    catch
    end
end

colorscheme!("Monokai16")
OhMyREPL.input_prompt!("ccJ>", :green)


##### end # module

