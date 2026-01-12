#include <zephyr/kernel.h>
#include <zephyr/device.h>
#include <zephyr/drivers/gpio.h>
#include <zephyr/sys/printk.h>

#define LED_NODE    DT_ALIAS(led0)
#define BUTTON_NODE DT_ALIAS(button0)

class LedButtonApp {
private:
    const struct device *led_dev;
    const struct device *button_dev;
    gpio_pin_t led_pin;
    gpio_pin_t button_pin;

public:
    // Constructor: initialize devices and configure pins
    LedButtonApp() {
        led_dev = DEVICE_DT_GET(DT_GPIO_CTLR(LED_NODE, gpios));
        button_dev = DEVICE_DT_GET(DT_GPIO_CTLR(BUTTON_NODE, gpios));

        led_pin = DT_GPIO_PIN(LED_NODE, gpios);
        button_pin = DT_GPIO_PIN(BUTTON_NODE, gpios);

        if (!device_is_ready(led_dev) || !device_is_ready(button_dev)) {
            printk("LED or Button device not ready\n");
            return;
        }

        // Configure LED pin as output
        gpio_pin_configure(led_dev, led_pin, GPIO_OUTPUT_INACTIVE);

        // Configure Button pin as input
        gpio_pin_configure(button_dev, button_pin, GPIO_INPUT);

        printk("LedButtonApp initialized\n");
    }

    // Destructor: cleanup if needed
    ~LedButtonApp() {
        // Turn off LED before exit
        gpio_pin_set(led_dev, led_pin, 0);
        printk("LedButtonApp destroyed\n");
    }

    // Main loop: poll button and control LED
    void run() {
        while (true) {
            int val = gpio_pin_get(button_dev, button_pin);
            if (val == 0) { // button pressed (active low)
                gpio_pin_set(led_dev, led_pin, 1);
            } else {
                gpio_pin_set(led_dev, led_pin, 0);
            }
            k_sleep(K_MSEC(100));
        }
    }
};

// extern "C" void main(void)
// {
//     LedButtonApp app;
//     app.run();
// }
