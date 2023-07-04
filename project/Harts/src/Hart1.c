#include "Harts.h"
#include "fpioa.h"
#include "gpio.h"
#include "gpiohs.h"

#define LED_G   4u
#define LED_R   3u
#define LED_B   5u

#define MAX_COUNTER_VAL 7u

int main_h1(void){
    uint8_t     led_counter = 0;

    gpio_pin_value_t     led_state = GPIO_PV_LOW;
    printf("Core 1: Hello world\n");
        
    sysctl_set_power_mode(SYSCTL_POWER_BANK2,SYSCTL_POWER_V33);

    fpioa_set_function( 13u, FUNC_GPIO3);
    fpioa_set_function( 12u, FUNC_GPIO4);
    fpioa_set_function( 14u, FUNC_GPIO5);

    (void) fpioa_init();
    if( gpio_init() < 0 ){
        printf("Core 1: GPIO not initialized");
        for(;;);
    }

    gpio_set_drive_mode( 3 , GPIO_DM_OUTPUT );
    gpio_set_drive_mode( 4 , GPIO_DM_OUTPUT );
    gpio_set_drive_mode( 5 , GPIO_DM_OUTPUT );

    gpio_set_pin( LED_R , GPIO_PV_HIGH );
    gpio_set_pin( LED_G , GPIO_PV_HIGH );
    gpio_set_pin( LED_B , GPIO_PV_HIGH );
    while(1){
        led_counter++;
        if( MAX_COUNTER_VAL < led_counter ){
            led_counter = 0;
        }
        printf("Core 1: Led counter : %d\n", led_counter );
        gpio_set_pin( LED_R , 0x1 & (led_counter) );
        gpio_set_pin( LED_G , 0x1 & (led_counter >> 1) );
        gpio_set_pin( LED_B , 0x1 & (led_counter >> 2) );
        sleep(2);
    }

    return 0;
}
