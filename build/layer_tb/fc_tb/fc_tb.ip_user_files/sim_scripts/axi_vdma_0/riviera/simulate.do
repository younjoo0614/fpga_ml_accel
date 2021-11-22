onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+axi_vdma_0 -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.axi_vdma_0 xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {axi_vdma_0.udo}

run -all

endsim

quit -force
