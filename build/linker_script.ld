ENTRY(Reset_Handler)


MEMORY
{
    FLASH (rx): ORIGIN = 0x00000000 , LENGTH = 512M
    SRAM (rwx): ORIGIN = 0x20000000 , LENGTH = 512M
}


SECTIONS
{
    .text :
    {
        *(.isr_vector)
        *(.text)
        *(.text.*)
        *(.rodata)
        *(.rodata.*)
        . = ALIGN(4);
        end_of_text = .;
    }> FLASH


    _la_data = LOADADDR(.data);

    .data :
    {
        start_of_data = .;
        
        *(.data)
        *(.data.*)

        . = ALIGN(4);
        end_of_data = .;
    }> SRAM AT> FLASH

    .bss :
    {
        start_of_bss = .;
        __bss_start__ = start_of_bss;
        
        *(.bss)
        *(.bss.*)
        *(COMMON)

        . = ALIGN(4);
        end_of_bss = .;
        __bss_end__ = end_of_bss;
        . = ALIGN(4);
        end = .;
        __end__ = .;
    }> SRAM
}