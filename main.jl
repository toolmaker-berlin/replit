# --------------------------
# Nur 1xRun (main.jl) (DEMO)
# REPLIT macht Fehler, 
# (RUN/STOP/EDIT/RUN-ZYKLUS)
# besser nur SHELL benutzen!
#            ===============
#   + MAC ohne  @[]{}\| usw. 
#   ========================
#
# Stand 19. April 2024
# --------------------------

println("Julia - so nicht!")

try
  using Crayons
catch
  script = "ln -s " * pwd() * "/.julia/ ~/.julia"
  run(`sh -c $script`;wait=true)
end

# include("demo/_mainmenue!.jl")
# Keine Cursortasten in Console
# exit(0) # KEIN EXIT
# STOP/EDIT/RUN 
# ODER SHELL BENUTZEN!

