#include "Harts.h"

int main_h0(void){
    int data;
    printf("Core 0: Hello world\n");

    // Enable Hardware Thread 1
        clint_ipi_send( 1u );
        atomic_set(&g_wake_up[1u], 1);

    /* Clear stdin buffer before scanf */
    sys_stdin_flush();

    scanf("%d", &data);
    printf("\nData is %d\n", data);
    while(1);

    return 0;
}
