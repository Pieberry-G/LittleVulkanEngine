#include "FirstApp.h"

namespace lve {

	void FirstApp::run()
	{
		while (!lveWindow.ShouldClose())
		{
			glfwPollEvents();
		}
	}

}