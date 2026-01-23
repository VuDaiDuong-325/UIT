onerror {quit -f}
vlib work
vlog -work work MSSV.vo
vlog -work work MSSV.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Combi_vlg_vec_tst
vcd file -direction MSSV.msim.vcd
vcd add -internal Combi_vlg_vec_tst/*
vcd add -internal Combi_vlg_vec_tst/i1/*
add wave /*
run -all
