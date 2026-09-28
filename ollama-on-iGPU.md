Here is a clean, markdown-formatted guide you can copy and paste directly into a GitHub repository or a Gist (e.g., as README.md).
------------------------------
## Running Ollama on Windows Integrated GPUs (iGPU) via Vulkan
By default, Ollama filters out integrated graphics processing units (iGPUs)—such as AMD Radeon Graphics, Intel Iris Xe, or Intel Arc found in laptops and mini PCs—to prevent system lag. It will automatically fall back to the CPU.
To force Ollama to recognize and use your integrated graphics chip for hardware acceleration, you must explicitly enable it using Windows Environment Variables.
## 🚀 Setup Steps## Step 1: Completely Stop Ollama
Before making changes, you must kill the background Ollama server process:

   1. Look for the Ollama icon in your taskbar system tray (bottom-right corner, near the clock).
   2. Right-click the icon and click Quit.
   3. (Optional) To guarantee it's closed, open PowerShell and run:
   
   Stop-Process -Name "ollama*" -Force
   
   
## Step 2: Configure Environment Variables

   1. Press the Windows Key, type environment variables, and select Edit environment variables for your account.
   2. Under the User variables section (the top half), click the New... button.
   3. Add the following variable to allow Ollama to target integrated chips:
   * Variable name: OLLAMA_IGPU_ENABLE
      * Variable value: 1
   4. (Optional but Recommended) Add the Vulkan wrapper configuration to explicitly bind the backend:
   * Click New... again.
      * Variable name: OLLAMA_VULKAN
      * Variable value: 1
   5. Click OK on all open windows to save the settings.

## Step 3: Verify the Acceleration

   1. Launch Ollama again from your Windows Start Menu.
   2. Open your terminal (Command Prompt or PowerShell) and run your model with the verbose flag to monitor performance metrics:
   
   ollama run <your-model-name> --verbose
   
   3. Type a prompt. After the response finishes generating, look at the stats block printed at the end. Your eval rate (Tokens per Second) should be significantly higher than CPU execution.

## 📊 Quick Summary of Toggles

| Variable | Value | Purpose |
|---|---|---|
| OLLAMA_IGPU_ENABLE | 1 | Required. Stops Ollama from skipping non-discrete/integrated graphics cards. |
| OLLAMA_VULKAN | 1 | Forces Ollama to target the built-in Vulkan runtime backend layer. |

------------------------------
Would you like to add an advanced configuration section to this markdown guide, such as how to tweak VRAM allocation (num_gpu) inside a custom Modelfile to maximize your iGPU's performance?

