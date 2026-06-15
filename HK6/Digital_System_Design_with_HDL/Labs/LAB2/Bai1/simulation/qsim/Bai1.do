onerror {quit -f}
vlib work
vlog -work work Bai1.vo
vlog -work work Bai1.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.counter_4bit_behav_vlg_vec_tst
vcd file -direction Bai1.msim.vcd
vcd add -internal counter_4bit_behav_vlg_vec_tst/*
vcd add -internal counter_4bit_behav_vlg_vec_tst/i1/*
add wave /*
run -all
