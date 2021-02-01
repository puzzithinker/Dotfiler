<h1 align="center">
Unbox
</h1>

**Unbox** is a Bash tool to quickly set up Kali/Parrot/Debian machines with personal presets.

## Install
```bash
▶ git clone https://github.com/JakeWnuk/unbox.git
```

## Features
**Unbox** is an automated installer that sets up several network and web application penetration testing tools setting up new environments quickly. Configuration dotfiles can be stored within the dotfiles folder to be automatically symbolic linked with `stow` for easy administration. Users who maintain their dotfiles in a VCS can quickly swap the folder contents for their own presets. **Unbox** also configures standard tools, installs wordlists, and installs high-performance tools written in Golang and Bash (see tools.json) that are not found in out of the box distros. Customization is quickly done by editing the configuration files of the project.

Based on and inspired by the work on `axiom-local` by [pry0cc](https://github.com/pry0cc).
