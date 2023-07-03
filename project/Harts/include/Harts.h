#ifndef _HARTS_H_
#define _HARTS_H_

    #include <bsp.h>
    #include <sysctl.h>
    #include <stdint.h>

    /* BSP core enable flag */
    extern volatile uint64_t g_wake_up[2];

    /**
     * @brief main for hart 0
    */
    extern int main_h0(void);

    /**
     * @brief main for hart 1
    */
    extern int main_h1(void);

#endif
