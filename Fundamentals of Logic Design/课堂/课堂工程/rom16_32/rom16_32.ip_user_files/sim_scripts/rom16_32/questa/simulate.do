onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib rom16_32_opt

do {wave.do}

view wave
view structure
view signals

do {rom16_32.udo}

run -all

quit -force
