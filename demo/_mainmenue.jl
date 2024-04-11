##############
# mainmenue.jl
##############

stflg=!false

print("\033c") # Funktioniert nicht überall

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
    
    print("\n\nWelche Datei ausführen (q oder 0=Ende, Enter=Whlg.)? ",i)
    
    opt='0'
    while true
          global opt

          opt = getc()
          if opt == 'q'
              opt ='0'
              break
          else
              if opt in "1234567890" || Int(opt) == 13
                break
              end
              continue
          end

    end

  end
  
  sel=Int(opt)-48
  if sel == -35 sel=1;end 
  if sel == 0 || sel == -35 return 1;end
  
  if endswith(filesorted[sel],".jl")
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
  
  return 0
  
end

while true
global filesorted=listfiles()
x=doit()
if x==1 println();break;end
str = Base.prompt("\n\nNochmal [Y] / N ? ") in ("","y","Y") ? "Y" : "N"
if str =="N" println();break;end
print("\033c")
end



