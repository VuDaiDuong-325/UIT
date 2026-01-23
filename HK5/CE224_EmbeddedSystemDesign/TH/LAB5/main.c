extern unsigned int Image$$ER_IROM1$$RW$$Base;
extern unsigned int Image$$RW_IRAM1$$RW$$Base;
extern unsigned int Image$$RW_IRAM1$$RW$$Length;
void Reset_Handler(void);
void MMI_Handler(void);

static const unsigned int vector_table[]
__attribute__( (used, section("RESET") )) =
{
(unsigned int)0x20004000,
(unsigned int)&Reset_Handler,
(unsigned int)&MMI_Handler,
};

static volatile unsigned int var_data __attribute__((used)) = 5;

int main ()
{
	unsigned int var_a = var_data;
	
	while (1) {	
		
	}
}

void Reset_Handler(void){
	// 1. Disable all interrupts
	unsigned int ADD_ER_ROM_BASE = (unsigned int)&Image$$ER_IROM1$$RW$$Base;
	unsigned int ADD_ER_RAM_BASE = (unsigned int)&Image$$RW_IRAM1$$RW$$Base;
	unsigned int ADD_ER_RAM_LENGTH = (unsigned int)&Image$$RW_IRAM1$$RW$$Length;
	
	for (unsigned int i = 0; i < ADD_ER_RAM_LENGTH; i++){
		*(unsigned char *)(ADD_ER_RAM_BASE + i) = *(unsigned char *)(ADD_ER_ROM_BASE + i);
	}
	// 6. Call main function
	main();
}

void MMI_Handler(void) {
	
}