onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib axi_interconnect_1_opt

do {wave.do}

view wave
view structure
view signals

do {axi_interconnect_1.udo}

run -all

quit -force
