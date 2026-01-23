onerror {quit -f}
vlib work
vlog -work work MSSV_BDB.vo
vlog -work work MSSV_BDB.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.MSSV_BDB_vlg_vec_tst
vcd file -direction MSSV_BDB.msim.vcd
vcd add -internal MSSV_BDB_vlg_vec_tst/*
vcd add -internal MSSV_BDB_vlg_vec_tst/i1/*
add wave /*
run -all
