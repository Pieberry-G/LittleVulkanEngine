#pragma once

#include "lve_device.hpp"
#include "lve_game_object.hpp"
#include "lve_pipeline.hpp"
#include "lve_swap_chain.hpp"
#include "lve_window.hpp"

#include <memory>
#include <vector>

namespace lve {

	class FirstApp
	{
	public:
		static constexpr int WIDTH = 1280;
		static constexpr int HEIGHT = 720;

		FirstApp();
		~FirstApp();

		FirstApp(const FirstApp&) = delete;
		FirstApp& operator=(const FirstApp&) = delete;

		void run();
	private:
		void loadGameObjects();
		void createPipelineLayout();
		void createPipeline();
		void createCommandBuffers();
		void recordCommandBuffer(int imageIndex);
		void freeCommandBuffers();
		void drawFrame();
		void recreateSwapChain();
		void renderGameObjects(VkCommandBuffer commandBuffer);
	private:
		LveWindow lveWindow{ WIDTH, HEIGHT, "Hello Vulkan" };
		LveDevice lveDevice{ lveWindow };
		std::unique_ptr<LveSwapChain> lveSwapChain;
		std::unique_ptr<LvePipeline> lvePipeline;
		VkPipelineLayout pipelineLayout;
		std::vector<VkCommandBuffer> commandBuffers;
		std::vector<LveGameObject> gameObjects;
	};

}