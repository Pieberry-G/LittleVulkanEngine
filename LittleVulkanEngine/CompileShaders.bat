@echo off
setlocal

REM 检查 VULKAN_SDK 环境变量是否已设置
if not defined VULKAN_SDK (
    echo The VULKAN_SDK environment variable is not set.
    exit /b
)

REM 设置 Vulkan SDK 的路径
set GLSLC="%VULKAN_SDK%\Bin\glslc.exe"

REM 遍历 shaders 目录下的所有 .vert 文件
for %%f in (shaders\*.vert) do (
    echo Compiling %%f ...
    %GLSLC% "%%f" -o "%%f.spv"
)

REM 遍历 shaders 目录下的所有 .frag 文件
for %%f in (shaders\*.frag) do (
    echo Compiling %%f ...
    %GLSLC% "%%f" -o "%%f.spv"
)

endlocal