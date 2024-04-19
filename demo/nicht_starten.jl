print("\033c") # cls
println("... nur ansehen! Code nicht starten!")
exit(0)
## Bilder nach Datum sortieren (Gisela)
"""
**Achtung:** Nicht mehr starten, da schon alles sortiert und verschoben wurde.
Der Code dient nur noch zur Anschauung.
"""

# das richtige Verzeichnis finden
av="/Volumes/SSD 2TB (Extern TV)/SAVE DATEN Extern TV/Photos 2016-2022"
cd(av)
pwd()

# Unterverzeichnisse anlegen
mo  = ("01 (Jan)","02 (Feb)","03 (Mrz)","04 (Apr)","05 (Mai)",
    "06 (Jun)","07 (Jul)","08 (Aug)","09 (Sep)",
    "10 (Okt)","11 (Nov)","12 (Dez)")
ja  = ("2016-","2017-","2018-","2019-","2020-","2021-","2022-")
for j in ja, m in mo
    mkd = j*m
    if j == "2022-" && m == "03 (Mrz)" break
    end
    mkpath(mkd) # Besser als mkdir()
end
println("Verzeichnisse angelegt!")

import Dates
#cd() #zum Test Homeverzeichnis
println("Current directory: ", pwd())
zae=0
foreach(readdir()) do f
    global zae
    if endswith(f, ".JPG")
        x = string(Dates.unix2datetime(mtime(f)))
        j = parse(Int64,x[1:4])  
        m = parse(Int64,x[6:7])
        # println(f," ",x," ",j," ",m)
        dest = "./"*ja[j-2015]*mo[m]*"/"*f
        # println(dest)
        mv(f, dest, force=true)
        zae+=1
    end
end
println("Fertig! $zae Dateien verschoben.")
