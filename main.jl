# --------------------------
# Nur 1xRun (main.jl) (DEMO)
# REPLIT macht Fehler, 
# besser die SHELL benutzen!
# 
# Stand 8. April 2024
# --------------------------

try
  using Crayons
catch
  script = "ln -s " * pwd() * "/.julia/ ~/.julia"
  run(`sh -c $script`;wait=true)
end

include("mainmenue.jl")

exit(0)
