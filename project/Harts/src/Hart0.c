#include "Harts.h"

#define MAX_COUNTER_VAL 0xFFFF

int main_h0(void){
    unsigned int counter;
    printf("Core 0: Hello world\n");

    // Enable Hardware Thread 1
        clint_ipi_send( 1u );
        atomic_set(&g_wake_up[1u], 1);

    while(1){
        counter++;
        if( counter == MAX_COUNTER_VAL ){
            counter = 0;
        }
        printf("Core 0: Counter %u\n",counter);
        sleep(1);
    }

    return 0;
}
