-- MoonVulkan example: hello.lua

local vk = require("moonvulkan")
require "luarocks.loader"


-- Create a Vulkan instance:
local instance = vk.create_instance({
   application_info = {
      application_name = 'Hello',
      application_version = 1,
      api_version = vk.make_version(1,0,0)
   },
   enabled_layer_names = { 
      'VK_LAYER_LUNARG_standard_validation', 
   -- 'VK_LAYER_LUNARG_api_dump', -- uncomment to see API call dumps
   }
})

-- Enumerate physical devices:
local physdevs = vk.enumerate_physical_devices(instance)
print("Number of available physical devices: " ..#physdevs)
assert(#physdevs > 0)

-- Select the first device:
local gpu = physdevs[1]

-- Get its properties, and print a few:
local props = vk.get_physical_device_properties(gpu)
print("Device name: ".. props.device_name)
print("Device type: ".. props.device_type)
print("Driver version: ".. vk.version_string(props.driver_version))
print("API version: ".. vk.version_string(props.api_version))
-- ...

-- Note: objects are automatically destroyed at exit so there is no need for cleanup
