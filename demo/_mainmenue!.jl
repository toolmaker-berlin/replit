##############
# mainmenue.jl
##############

print("\033c") # Funktioniert nicht überall

bekannt=Dict("_mainmenue!.jl" => "Menue/Filesystem",
"display_ctrl.jl"    => "Pos & Farben",
"fib.jl"             => "Fibonacci",
"input_readline.jl"  => "einfachster Input",
"juliabench.jl"      => "Threads Speed",
"latex_julia.jl"     => "π,∈ Beispiel",
"offsetarraytest.jl" => "0-n Array vgl.",
"readme.jl"          => "Diese Liste",
"string_like_py.jl"  => "Operator overload",
"termsize.jl"        => "Zeile/Spalte",
"term.py"            => "Zeile/Spalte Pyton",
"speed.py"           => "Pyton Test")

# println(pwd()) # test wo sind wir
# cd("demo")

# Doppelt gemoppelt aus main.jl
try
  using Crayons
catch
  script = "ln -s " * pwd() * "/.julia/ ~/.julia"
  run(`sh -c $script`;wait=true)
end

# Ein Zeichen via ccall
function getc()
    ret = ccall(:jl_tty_set_mode, Int32, (Ptr{Cvoid},Int32), stdin.handle, true)
    ret == 0 || error("Unable to switch to raw mode")
    c = read(stdin, Char)
    ccall(:jl_tty_set_mode, Int32, (Ptr{Cvoid},Int32), stdin.handle, false)
    return c
end


using Dates

function listfiles()
	xdir=readdir()
  fileliste=Vector{String}()
  dateliste=Vector{String}()
  for na in xdir
		if (endswith(na,".jl") || endswith(na,".py")) && !startswith(na,"_")
      x=Dates.unix2datetime(mtime(na)) 
			y=(string(x)*" "*na)
      push!(fileliste,na)
      push!(dateliste,string(x))
		end
	end
  permvec=sortperm(dateliste,rev=true)
  return fileliste[permvec] 
end


filesorted=listfiles()

macro ls()
	quote
		listfiles()
	end
end


# Neue Struktur mit Buildin-Menue
import REPL 
using REPL.TerminalMenus

while true
  print("\033c")
  
  optionsmit=Vector{String}()

  global options=listfiles()
  for op in options
    if get(bekannt, op, "???") != "???"
      push!(optionsmit,(op*" "^30)[1:20]*" -> "*get(bekannt, op, "???"))
    else 
      push!(optionsmit,(op*" "^30)[1:20]*" -> "*"?")
    end
  end

  lines=displaysize(stdout)[1]-5
  if lines < 5
    lines=5
  end
  columes=displaysize(stdout)[2]
  if columes < 60
    replace!(opx -> replace(opx, "!.jl"  => " "), optionsmit)
    replace!(opx -> replace(opx, "!.py"  => " "), optionsmit)
    replace!(opx -> replace(opx, ".jl"   => ""), optionsmit)
    replace!(opx -> replace(opx, ".py"   => ""), optionsmit)
    replace!(opx -> replace(opx, " -> "  => ""), optionsmit)
  end
  
  menu = RadioMenu(optionsmit, scroll_wrap=true, pagesize=lines, charset=:unicode)
  choice = request("Auswahl Datei mit CR oder Q=Quit", menu)

  if choice != -1 

    if endswith( options[choice],".jl")
       script = "julia '" * pwd() * "/" *
       options[choice] * "'"
      println()
      run(`sh -c $script`;wait=true)
      println()
    else
      script = "python '" * pwd() * "/" *
       options[choice] * "'"
      println()
      run(`sh -c $script`;wait=true)
      println()
    end

    touch(options[choice])
    
    str = Base.prompt("Nochmal [Ja] / Nein? ") in ("","ja","Ja","j","J","y","Y","Yes","yes") ? "Y" : "N"
    if str =="N" println();break;end
    
  else println("\nMenu canceled.");println();break;end

end



