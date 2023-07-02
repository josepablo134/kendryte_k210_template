// #include <bsp.h>
// #include <sysctl.h>

/**
 * @brief main for core 0
*/
int main_h0( void ){
    while(1);
    
    return 0;
}

/**
 * @brief main for core 1
*/
int main_h1( void ){
    while(1);
    
    return 0;
}

/**
 * @brief Multicore main function, this is the entry point of the project.
 * This function is executed by all cores after reset evets.
*/
int main( void ){
    // sysctl_pll_set_freq(SYSCTL_PLL0, 800000000);
    while(1);

    return 0;
}