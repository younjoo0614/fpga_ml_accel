onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+axi_to_apb -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.axi_to_apb xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {axi_to_apb.udo}

run -all

endsim

quit -force
