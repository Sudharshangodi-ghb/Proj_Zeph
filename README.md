# stm32f446re - Zephyr
STM32F446RE Nucleo Zephyr with C Programming


# STM32F446RE Hardware Connections (Project IO configuration for each component)


| Peripheral | Connected Device | STM32F446RE Pins | Notes / Changes Made |
| :--- | :--- | :--- | :--- |
| **I2S2 (RX)** | Digital Audio Input | **`PB12` (WS), `PB13` (CK), `PC3` (SD)** | **[NEW]** Dedicated to audio capture. Uses safe, open pins. |
| **I2S3 (TX)** | Digital Audio Output | **`PA4` (WS), `PC10` (CK), `PC12` (SD)** | **[NEW]** Dedicated to audio playback. Reallocates `PC10` and `PA4`. |
| **UART3** | GSM (SIM800) | **`PD2` (TX3)**, `PC11` (RX3) | **[UPDATED]** TX shifted to **`PD2`** to free up `PC10` for the I2S3 clock line. |
| **SPI1** | MPU6050 (SPI option) | `PB3` (SCK), `PB4` (MISO), `PB5` (MOSI), **`PB0` (CS)** | **[UPDATED]** CS shifted to **`PB0`** to free up `PA4` for the I2S3 word select line. |
| **User LED** | LD2 (Green) | `PA5` | Active HIGH (Onboard). |
| **Button** | B1 (User Button) | `PC13` | Active LOW, internal pull-up enabled (Onboard). |
| **UART1** | HC-05 Bluetooth | `PA9` (TX1), `PA10` (RX1) | For wireless serial communication. |
| **UART2** | ST-LINK VCP (Debug) | `PA2` (TX2), `PA3` (RX2) | Used for system logs and `printf()` debugging over USB. |
| **ADC1** | LM35 Temp Sensor | `PA0` (ADC123_IN0) | Analog voltage measurement. |
| **PWM (TIM4)** | Servo Motor | `PB6` (TIM4_CH1) | 50Hz PWM, duty cycle controlled. |
| **I2C3** | LCD (PCF8574) | `PC9` (SDA3), `PA8` (SCL3) | Alternate I2C mapping to clear pins for CAN bus. |
| **CAN1** | MCP2551 Transceiver | `PB8` (CAN1_RX), `PB9` (CAN1_TX) | Standard CAN network interface. |



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


