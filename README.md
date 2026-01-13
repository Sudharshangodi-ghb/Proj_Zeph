# stm32f446re - Zephyr
STM32F446RE Nucleo Zephyr with C Programming


# STM32F446RE Hardware Connections (Project IO configuration for each component)
|   Peripheral   |   Connected Device      |   STM32F446RE Pins                                   |   Notes                                                    |
| -------------- | ----------------------- | ---------------------------------------------------- | ---------------------------------------------------------- |
|   User LED     | LD2 (Green)             |  PA5                                                 | Active HIGH                                                |
|   Button       | B1 (User Button)        |  PC13                                                | Active LOW, pull-up enabled                                |
|   UART1        | HC-05 Bluetooth         |  PA9 (TX1) ,  PA10 (RX1)                             | For wireless serial communication                          |
|   UART2        | ST-LINK VCP (Debug)     |  PA2 (TX2) ,  PA3 (RX2)                              | Used for  printf() /debug                                  |
|   UART3        | GSM (SIM800)            |  PC10 (TX3) ,  PC11 (RX3)                            | Alternate to PB10/PB11                                     |
|   ADC1         | LM35 Temperature Sensor |  PA0 (ADC123_IN0)                                    | Analog voltage measurement                                 |
|   PWM (TIM4)   | Servo Motor             |  PB6 (TIM4_CH1)                                      | 50Hz PWM, duty cycle controlled                            |
|   SPI1         | MPU6050 (SPI option)    |  PB3 (SCK) ,  PB4 (MISO) ,  PB5 (MOSI) ,  PA4 (NSS)  | Use if MPU6050 is configured for SPI (usually I2C default) |
|   I2C3         | LCD (PCF8574 Backpack)  |  PC9 (SDA3) ,  PA8 (SCL3)                            | Alternate I2C if PB8/PB9 used for CAN                      |
|   CAN1         | MCP2551 Transceiver     |  PB8 (CAN1_RX) ,  PB9 (CAN1_TX)                      | Standard CAN interface                                     |


<img width="592" height="457" alt="image" src="https://github.com/user-attachments/assets/5de31c7a-333e-4ff3-b54a-1d890a5c3079" />



zpp_srg/
 ├── app/
 │   ├── src/
 │   │   ├── main.cpp          # Entry point
 │   │   ├── bluetooth.cpp     # HC-05 logic
 │   │   ├── gsm.cpp           # SIM800 logic
 │   │   ├── sensors.cpp       # LM35, MPU6050
 │   │   ├── servo.cpp         # PWM control
 │   │   └── canbus.cpp        # MCP2551 CAN logic
 │   ├── include/
 │   │   ├── bluetooth.hpp
 │   │   ├── gsm.hpp
 │   │   ├── sensors.hpp
 │   │   ├── servo.hpp
 │   │   └── canbus.hpp
 │   ├── boards/
 │   │   └── nucleo_f446re.overlay
 │   └── prj.conf
 ├── modules/                  # Reusable libraries
 │   ├── bluetooth/
 │   │   ├── bt_driver.cpp
 │   │   └── bt_driver.hpp
 │   ├── gsm/
 │   │   ├── gsm_driver.cpp
 │   │   └── gsm_driver.hpp
 │   ├── sensors/
 │   │   ├── lm35_driver.cpp
 │   │   └── lm35_driver.hpp
 │   └── can/
 │       ├── can_driver.cpp
 │       └── can_driver.hpp
 └── CMakeLists.txt


