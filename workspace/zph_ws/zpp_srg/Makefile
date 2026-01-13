# Board and app configuration
board_type   = nucleo_f446re
app_dir      = app
build_folder = build

# Pristine build option
PRISTINE ?= 0
ifeq ($(PRISTINE),1)
    pristine_build := --pristine=always
else
    pristine_build :=
endif

# Shell settings for Windows vs Linux
ifeq ($(OS),Windows_NT)
    SHELL := cmd.exe
    .SHELLFLAGS := /C
else
    SHELL := /bin/bash
    .SHELLFLAGS := -c
endif

# Targets
build_app:
    west build $(pristine_build) -b $(board_type) $(app_dir) -d $(build_folder)

flash_app:
    west flash -d $(build_folder) --runner stlink

clean_app:
    west build -d $(build_folder) -t clean
