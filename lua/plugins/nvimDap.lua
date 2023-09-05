return {
	"mfussenegger/nvim-dap",
	config = function ()
		local dap = require("dap")

		dap.adapters.unity = {
			type = 'executable',
			command = '<path-to-mono-directory>/Commands/mono',
			args = {'<path-to-unity-debug-directory>/unity.unity-debug-x.x.x/bin/UnityDebug.exe'}
		}
		dap.configurations.cs = {
			{
				type = 'unity',
				request = 'attach',
				name = 'Unity Editor',
			}
		}

	end
}
