onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib sram_32x2560_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {sram_32x2560.udo}

run -all

quit -force
