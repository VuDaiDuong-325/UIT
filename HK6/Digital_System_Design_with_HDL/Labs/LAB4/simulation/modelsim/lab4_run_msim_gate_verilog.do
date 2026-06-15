transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {lab4.vo}

vlog -vlog01compat -work work +incdir+D:/HK6/Digital_System_Design_with_HDL/Labs/LAB4 {D:/HK6/Digital_System_Design_with_HDL/Labs/LAB4/tb_ALU_32bit.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L cycloneii_ver -L gate_work -L work -voptargs="+acc"  tb_ALU_32bit

add wave *
view structure
view signals
run -all
