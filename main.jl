# --------------------------
# REPLIT macht Fehler!
# (RUN/STOP/EDIT/RUN-ZYKLUS)
# besser nur SHELL benutzen!
#            ===============
#   + MAC ohne  @[]{}\| usw. 
#   + iPhone ohne Cursor ...
#   ========================
#
# Stand 19. April 2024
# --------------------------

try
  using Crayons
catch
  script = "ln -s " * pwd() * "/.julia/ ~/.julia"
  run(`sh -c $script`;wait=true)
end

using OhMyREPL
cd("demo")
include("demo/_mainmenue!.jl")
println("\033c","Julia Repl Mode ...!")

# exit(0) # KEIN EXIT

