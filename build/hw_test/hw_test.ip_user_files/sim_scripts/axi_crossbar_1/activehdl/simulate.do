onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+axi_crossbar_1 -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.axi_crossbar_1 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {axi_crossbar_1.udo}

run -all

endsim

quit -force
