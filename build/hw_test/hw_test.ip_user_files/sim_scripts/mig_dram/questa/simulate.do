onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib mig_dram_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {mig_dram.udo}

run -all

quit -force
