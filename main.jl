# ------------------------------------
# Run (main.jl) DEMO - repl mit Pakete
# REPLIT macht Fehler - SHELL benutzen
# ------------------------------------

try
  using Crayons
catch
  script = "ln -s " * pwd() * "/.julia/ ~/.julia"
  run(`sh -c $script`;wait=true)
end

include("mainmenue.jl")

# Besser in Julia bleiben - KEIN Exit(0)
# exit(0)
