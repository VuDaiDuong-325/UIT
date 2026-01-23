onerror {quit -f}
vlib work
vlog -work work Mulw4ln.vo
vlog -work work Mulw4ln.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Mulw4ln_vlg_vec_tst
vcd file -direction Mulw4ln.msim.vcd
vcd add -internal Mulw4ln_vlg_vec_tst/*
vcd add -internal Mulw4ln_vlg_vec_tst/i1/*
add wave /*
run -all
