/**
 * @author Josepablo C.
 */
#include "Harts.h"

/* Multicore entry point */
int main(void)
{
    unsigned int core_id = current_coreid();
    int retVal = 0;
    if (core_id == 0)
    {
        retVal = main_h0();
    }
    else
    {
        retVal = main_h1();
    }
    return 0;
}
