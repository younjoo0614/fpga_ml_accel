onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+axi4_32_to_axilite -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.axi4_32_to_axilite xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {axi4_32_to_axilite.udo}

run -all

endsim

quit -force
