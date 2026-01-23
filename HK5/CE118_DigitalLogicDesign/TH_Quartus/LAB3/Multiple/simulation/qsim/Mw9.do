onerror {quit -f}
vlib work
vlog -work work Mw9.vo
vlog -work work Mw9.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.DD_vlg_vec_tst
vcd file -direction Mw9.msim.vcd
vcd add -internal DD_vlg_vec_tst/*
vcd add -internal DD_vlg_vec_tst/i1/*
add wave /*
run -all
