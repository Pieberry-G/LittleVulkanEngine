workspace "LittleVulkanEngine"
    architecture "x64"
    startproject "LittleVulkanEngine"
    
    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder {solution directory}
VULKAN_SDK = os.getenv("VULKAN_SDK")
IncludeDir = {}
IncludeDir["VulkanSDK"] = "%{VULKAN_SDK}/Include"
IncludeDir["GLFW"] = "LittleVulkanEngine/vendor/GLFW/include"
IncludeDir["glm"] = "LittleVulkanEngine/vendor/glm"
IncludeDir["stb_image"] = "LittleVulkanEngine/vendor/stb_image"

group "Dependencies"
    include "LittleVulkanEngine/vendor/GLFW"
group ""

project "LittleVulkanEngine"
    location "LittleVulkanEngine"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++20"
    staticruntime "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp",
        "%{prj.name}/vendor/stb_image/**.h",
        "%{prj.name}/vendor/stb_image/**.cpp",
        "%{prj.name}/vendor/glm/glm/**.hpp",
        "%{prj.name}/vendor/glm/glm/**.inl"
    }

    includedirs
    {
        "LittleVulkanEngine/src",
        "%{IncludeDir.VulkanSDK}",
        "%{IncludeDir.GLFW}",
        "%{IncludeDir.glm}",
        "%{IncludeDir.stb_image}"
    }

    libdirs
    {
        "%{VULKAN_SDK}/Lib"
    }

    links
    {
        "vulkan-1.lib",
        "GLFW"
    }

    -- pchsource "Hazel/src/hzpch.cpp"
    -- pchheader "hzpch.h"

    filter "system:windows"
        systemversion "latest"

        defines
        {
            "HZ_PLATFORM_WINDOWS",
            "HZ_ENABLE_ASSERTS",
            "GLFW_INCLUDE_NONE"
        }

    filter "configurations:Debug"
        defines { "VK_DEBUG" }
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines { "VK_NDEBUG" }
        runtime "Release"
        optimize "On"
    
    filter "configurations:Dist"
        defines { "VK_DIST" }
        runtime "Release"
        optimize "On"