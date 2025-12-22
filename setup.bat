REM filepath: c:\Work_Mirafra\Proj_Zeph\setup.bat
winget install Kitware.CMake Ninja-build.Ninja oss-winget.gperf Python.Python.3.12 Git.Git oss-winget.dtc wget 7zip.7zip

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command " [System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

choco -v

choco install vscode

python -m venv py_env

.\py_env\Scripts\Activate.ps1

python.exe -m pip install --upgrade pip

pip install -U west

pip3 install -r https://raw.githubusercontent.com/zephyrproject-rtos/zephyr/main/scripts/requirements.txt

cd workspace

west init zph_ws

cd zph_ws 

west update 

west zephyr-export 