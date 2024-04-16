ENV["GKS_ENCODING"] = "latin1"

import GR

GR.selntran(0)
GR.setcharheight(0.024)

function main()
    GR.settextfontprec(2, 0)
    y = 0
    for i in 0:1
        GR.text(0.05, 0.85-y, " !\"#\$\$%&'()*+,-./")
        GR.text(0.05, 0.80-y, "0123456789:;<=>?")
        GR.text(0.05, 0.75-y, "@ABCDEFGHIJKLMNO")
        GR.text(0.05, 0.70-y, "PQRSTUVWXYZ[\\]^_")
        GR.text(0.05, 0.65-y, "`abcdefghijklmno")
        GR.text(0.05, 0.60-y, "pqrstuvwxyz{|}~ ")

        GR.text(0.5, 0.85-y, collect(0xa0:0x1:0xaf))
        GR.text(0.5, 0.80-y, collect(0xb0:0x1:0xbf))
        GR.text(0.5, 0.75-y, collect(0xc0:0x1:0xcf))
        GR.text(0.5, 0.70-y, collect(0xd0:0x1:0xdf))
        GR.text(0.5, 0.65-y, collect(0xe0:0x1:0xef))
        GR.text(0.5, 0.60-y, collect(0xf0:0x1:0xff))

        GR.settextfontprec(233, 3)
        y = 0.4
    end
    GR.updatews()
end

main()
