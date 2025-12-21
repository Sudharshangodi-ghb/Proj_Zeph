
winget install Kitware.CMake Ninja-build.Ninja oss-winget.gperf Python.Python.3.12 Git.Git oss-winget.dtc wget 7zip.7zip

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command " [System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

choco -v

choco install vscode

python -m venv py_env

call py_env\Scripts\Activate.ps1

python.exe -m pip install --upgrade pip

pip install -U west

pip3 install -r https://github.com/zephyrproject-rtos/zephyr/blob/main/scripts/requirements.txt

west init zephyrproject

cd zephyrproject 

west update 

wesr zephyr-export 

west sdk install "."
