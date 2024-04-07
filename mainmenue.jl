stflg=!false

# print("\033c") # Funktioniert nicht überall

println(pwd()) #test wo sind wir

try
  using BenchmarkTools
catch
  println("Achtung, Julia fehlen Module!")
  # script = "source " * pwd() * "/ss"
  # run(`sh -c $script`;wait=true)
  # println()
  # sleep(3)
  # using BenchmarkTools
  exit(4711)
  # global stflg=true
end


function getc()
    ret = ccall(:jl_tty_set_mode, Int32, (Ptr{Cvoid},Int32), stdin.handle, true)
    ret == 0 || error("unable to switch to raw mode")
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
		if (endswith(na,"!.jl") || endswith(na,"!.py") || startswith(na,"demo") 
      && endswith(na,".jl") && !startswith(na,"demo menue"))
          #x=Dates.unix2datetime(stat(filePath).mtime);
      x=Dates.unix2datetime(mtime(na)) 
			y=(string(x)*" "*na)
      # println(y)
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
		#@edit xxx()
		#include("startjulia.jl")
		#println("in Arbeit!")
		listfiles()
	end
end

function doit()
  
  global sel,opt,fileliste,filesorted

  sel=1
  if stflg
    global i=0
    for (i,datei) in enumerate(filesorted)
      println(i => datei)
      if i >= 9 
        break
      end
    end
    print("\nWelche Datei ausführen (q oder 0=Ende, Enter=Whlg.)? ",i)
    #sel=parse(Int64,(chomp(readline())))
    opt='0'
    while true
          global opt

          opt = getc(); # error wenn c2
          if opt == 'q'
              opt ='0'
              break
          else
              if opt in "1234567890" || Int(opt) == 13
                #println(typeof(opt))
                #println(typeof(opt), " ",Int(opt))
                break
              end
              continue
          end

    end

  end
        sel=Int(opt)-48 #parse(Int64,chomp(opt))
        # println("+++",sel)
  #println(sel)
  #exit(2) 
  if sel == -35 sel=1;end 
  if sel == 0 || sel == -35 return 1;end
  
  if endswith(filesorted[sel],".jl")
    #include(filesorted[sel])
    #script = "julia ~/Julia-Work1/" *
     script = "julia '" * pwd() * "/" *
              filesorted[sel] * "'"
    println()
    run(`sh -c $script`;wait=true)
    println()
  else
    script = "python '" * pwd() * "/" *
             filesorted[sel] * "'"
    println()
    run(`sh -c $script`;wait=true)
    println()
  end
  touch(filesorted[sel])
  println("\n\nFertig mit ", (filesorted[sel]), " !!!")

  if endswith(filesorted[sel],"!!.jl") ||
     endswith(filesorted[sel],"!!.py")
     return 1
  else
     return 0
  end

end

while true
# print("\033c") # Funktioniert hier nicht
global filesorted=listfiles()
x=doit()
if x==1 break;end
  str = Base.prompt("\n Nochmal [Y] / N ? ") in ("","y","Y") ? "Y" : "N"
  if str =="N" break;end
end



