onerror {quit -f}
vlib work
vlog -work work Bai1.vo
vlog -work work Bai1.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Bai1_4state_vlg_vec_tst
vcd file -direction Bai1.msim.vcd
vcd add -internal Bai1_4state_vlg_vec_tst/*
vcd add -internal Bai1_4state_vlg_vec_tst/i1/*
add wave /*
run -all
