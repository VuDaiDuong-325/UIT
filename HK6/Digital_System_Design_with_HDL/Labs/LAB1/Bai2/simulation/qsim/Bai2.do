onerror {quit -f}
vlib work
vlog -work work Bai2.vo
vlog -work work Bai2.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Mux51_3bit_vlg_vec_tst
vcd file -direction Bai2.msim.vcd
vcd add -internal Mux51_3bit_vlg_vec_tst/*
vcd add -internal Mux51_3bit_vlg_vec_tst/i1/*
add wave /*
run -all
