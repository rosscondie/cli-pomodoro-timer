# Pomodoro Terminal Timer

A simple terminal-based Pomodoro timer written in Bash, using a clean timer and audio alert via `aplay`. This script supports work and break sessions with customizable durations and colorful output, designed for Windows (via WSL2) and Linux users.

## Acknowledgements

I would like to mention this project was inspired by the work of [bashbunni](https://github.com/bashbunni). 
Their script provided the foundation, which I tweaked to add the audio and custom durations. Thank you! 

## Features

- Work sessions (default: 45 minutes)
- Break sessions (default: 10 minutes)
- Audio alert using `alert.wav` (included)
- Colorful output with `lolcat` (optional)
- Compatible with Windows (WSL2) and Linux

## 🔧 Requirements

- **Bash** (pre-installed on Linux and WSL2)
- **`timer`** by [caarlos0](https://github.com/caarlos0/timer)
- **`aplay`** (via `alsa-utils` for playing the alert sound)
- **`lolcat`** for colorful output (optional)
- WSL2 (or any Linux system)
- A terminal with `zsh` or `bash` for alias setup

## Installation

1. **Install Dependencies:**
   Update your package manager and install `alsa-utils`, `tmux` (for `timer`), and `lolcat` (optional):
   ```bash
   sudo apt update
   sudo apt install alsa-utils lolcat
   ```
2. **Clone the Repository:**
   ```bash
   git clone https://github.com/<your-username>/cli-pomodoro-timer.git
   cd cli-pomodoro-timer
   ```
3. **Make the Script Executable:**
   ```bash
   chmod +x pomodoro.sh
   ```
4. **Move the Script to a local bin directory:**
   Copy the script and sound file to `~/.local/bin` (create the directory if it doesn't exist):
   ```bash
   mkdir -p ~/.local/bin 
   cp pomodoro.sh alert.wav ~/.local/bin/
   ```
5. **Set Up Aliases:**
   Add the following to your `~/.zshrc` or `~/.bashrc`:
   ```bash
   source ~/.local/bin/pomodoro.sh
   alias wo="pomodoro work"
   alias br="pomodoro break"
   ```
   Reload your shell config:
   ```bash
   source ~/.zshrc
   ```

## Usage

- Start a work session (45 minutes by default):
```bash
wo
```

- Start a break session (10 minutes by default):
```bash
br
```

- Specify a custom duration (e.g. 25-minute work session):
```bash
wo 25
```

