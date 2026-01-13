BOARD = nucleo_f446re
APP_DIR = app
BUILD_DIR = build

all:
    west build -b $(BOARD) $(APP_DIR) -d $(BUILD_DIR)

flash:
    west flash -d $(BUILD_DIR) --runner stlink

clean:
    west build -t clean -d $(BUILD_DIR)

rebuild:
    west build -p always -b $(BOARD) $(APP_DIR) -d $(BUILD_DIR)

debug:
    west debug -d $(BUILD_DIR) --runner openocd
