# How to Run Bonsai-demo on Windows

To run the [PrismML-Eng/Bonsai-demo](https://github.com/PrismML-Eng/Bonsai-demo) repository on **Windows**, make sure you are using **PowerShell** (not the traditional Command Prompt) to execute the setup and launch scripts.

---

## 1. Download and Install
Open PowerShell and run the following commands to clone the project and run the automated setup framework:

```powershell
git clone https://github.com/PrismML-Eng/Bonsai-demo.git
cd Bonsai-demo
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\setup.ps1
```

*The `setup.ps1` script will automatically check your system dependencies, install the `uv` package manager, download the **Bonsai 2 27B** weights (7.8 GB), and configure your environment.*

---

## 2. Start the Local Chat Server
Once the setup finishes completely, boot up the local inference server:

```powershell
.\scripts\start_llama_server.ps1
```

After running this script, open your web browser and navigate to **`http://localhost:8080`** to access the built-in chat interface, which includes support for vision uploads and native thinking capabilities.

---

## 💡 Hardware & Performance Tweaks for Windows

* **If you have a dedicated NVIDIA GPU:** The startup script will attempt to auto-detect your CUDA environment and offload all layers to your GPU for maximum speed.
* **If you run out of VRAM / System Memory:** The default 27B model can be demanding. You can explicitly shift to a much lighter model (like **4B** or **9B**) by running this variable declaration *before* you execute the setup or server scripts:
  ```powershell
  $env:BONSAI_MODEL = "4B"
  ```
* **Force CPU-Only Mode:** If your machine tries to use a weak integrated GPU via Vulkan and slows down, force the script to use your CPU instead:
  ```powershell
  $env:BONSAI_NGL = "0"
  ```