#include "Harts.h"
#include "fpioa.h"
#include "gpio.h"
#include "gpiohs.h"

#define LED_G   4u
#define LED_R   3u
#define LED_B   5u

int main_h1(void){
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
        if( led_state == GPIO_PV_LOW ){
            printf("Core 1: LED OFF\n");
            led_state = GPIO_PV_HIGH;
        }else{
            printf("Core 1: LED ON\n");
            led_state = GPIO_PV_LOW;
        }
        gpio_set_pin( LED_R , led_state );
        gpio_set_pin( LED_G , led_state );
        gpio_set_pin( LED_B , led_state );
        sleep(2);
    }

    return 0;
}
