#pragma once

#include "LveWindow.h"

namespace lve {

	class FirstApp
	{
	public:
		static constexpr int WIDTH = 1600;
		static constexpr int HEIGHT = 900;

		void run();
	private:
		LveWindow lveWindow{ WIDTH, HEIGHT, "Hello Vulkan" };
	};

}