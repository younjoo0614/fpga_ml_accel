onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib axi_to_apb_opt

do {wave.do}

view wave
view structure
view signals

do {axi_to_apb.udo}

run -all

quit -force
