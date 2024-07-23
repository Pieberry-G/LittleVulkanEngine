#pragma once

#define GLFW_INCLUDE_VULKAN
#include <GLFW/glfw3.h>

#include <string>

namespace lve {

	class LveWindow
	{
	public:
		LveWindow(int width, int height, const std::string& name);
		~LveWindow();

		LveWindow(const LveWindow&) = delete;
		LveWindow& operator=(const LveWindow&) = delete;
	
		bool ShouldClose() { return glfwWindowShouldClose(m_Window); }
	private:
		void InitWindow();

		const int m_Width, m_Height;

		std::string m_WindowName;
		GLFWwindow* m_Window;
	};

}