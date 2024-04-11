# --------------------------
# Nur 1xRun (main.jl) (DEMO)
# REPLIT macht Fehler, 
# (RUN/STOP/EDIT/RUN-ZYKLUS)
# besser die SHELL benutzen!
#            ===============
# Stand 8. April 2024
# --------------------------

println("Julia - so nicht!")

try
  using Crayons
catch
  script = "ln -s " * pwd() * "/.julia/ ~/.julia"
  run(`sh -c $script`;wait=true)
end

# include("test.jl")

# exit(0) # KEIN EXIT
# STOP/EDIT/RUN 
# ODER SHELL BENUTZEN!

