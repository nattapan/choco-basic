# Bonsai Demo Startup Guide (Custom Configuration)

This guide provides instructions on how to start the [Bonsai Demo](https://github.com/PrismML-Eng/Bonsai-demo) repository with custom parameters for **GPU layers (NGL)**, **context size (CTX)**, and the **9B model size**.

---

## 💻 macOS / Linux (Terminal)

To configure your session and launch the server, run the following commands in your terminal:

```bash
# 1. Select the 9B model size
export BONSAI_MODEL=9B

# 2. Set your custom GPU layers (replace 32 with your preferred count, or 0 for CPU-only)
export BONSAI_NGL=32

# 3. Set your custom context size (replace 16384 with any token length up to 262144)
export BONSAI_CTX=16384

# 4. Download the 9B weights (only needed for the first run)
./setup.sh

# 5. Launch the llama.cpp server
./scripts/start_llama_server.sh
```

*Note: For Apple Silicon Macs using the MLX backend, replace the final step with `./scripts/start_mlx_server.sh`.*

---

## 🪟 Windows (PowerShell)

Execute the following commands in an elevated PowerShell session:

```powershell
# 1. Select the 9B model size
$env:BONSAI_MODEL = "9B"

# 2. Set your custom GPU layers (replace 32 with your preferred layer count)
$env:BONSAI_NGL = "32"

# 3. Set your custom context size (replace 16384 with your token budget)
$env:BONSAI_CTX = "16384"

# 4. Run the Windows environment setup (only needed for the first run)
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\setup.ps1

# 5. Launch the server
.\scripts\start_llama_server.ps1
```

---

## ⚙️ Environment Variables Reference

| Variable | Target Value | Purpose |
| :--- | :--- | :--- |
| **`BONSAI_MODEL`** | `9B` | Overrides the default 27B model to load the lighter 9B profile. |
| **`BONSAI_NGL`** | *Integer* | Defines GPU layer offload. Set to `0` for CPU-only, or specify the layers to offload to VRAM. |
| **`BONSAI_CTX`** | *Integer* | Configures the token context limit. Supports up to `262144` tokens; `0` enables automatic RAM-tiered sizing. |
