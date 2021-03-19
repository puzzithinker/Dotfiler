<h1 align="center">
Dotfiler
</h1>

**Dotfiler** is a Bash tool to quickly set up Kali/Parrot/Debian machines with personal presets.

## Install
```bash
▶ git clone https://github.com/JakeWnuk/dotfiler.git
```

## Features
**Dotfiler** is an automated installer that sets up several network and web application penetration testing tools setting up new environments quickly. Configuration dotfiles can be stored within the dotfiles folder to be automatically symbolic linked with `stow` for easy administration. Users who maintain their dotfiles in a VCS can quickly swap the folder contents for their own presets. **Dotfiler** also configures standard tools, installs wordlists, and installs high-performance tools written in Golang and Bash (see tools.json) that are not found in out of the box distros. Customization is quickly done by editing the configuration files of the project.

Based on and inspired by the work on `axiom-local` by [pry0cc](https://github.com/pry0cc).

## Tools

### Packages
- [SpaceVim](https://spacevim.org/)
- [Oh My Zsh](https://ohmyz.sh/)
- [Oh My Tmux](https://github.com/gpakosz/.tmux)
- [Pipx](https://github.com/pipxproject/pipx)
- [AWS CLI](https://aws.amazon.com/cli/)
- [Stow](https://www.gnu.org/software/stow/)
- [Golang](https://golang.org/)

### Repositories
- [PayloadsAllTheThings](https://github.com/swisskyrepo/PayloadsAllTheThings)
- [PowerSploit](https://github.com/PowerShellMafia/PowerSploit)
- [Nishang](https://github.com/samratashok/nishang)

### Wordlists
- [Jhaddix's](https://gist.github.com/jhaddix/f64c97d0863a78454e44c2f7119c2a6a)
- [Tomnomnom's](https://gist.github.com/tomnomnom/57af04c3422aac8c6f04451a4c1daa51)
- [Seclists](https://github.com/danielmiessler/SecLists.git)
- [Web-Fuzz-Wordlist](https://github.com/kaimi-io/web-fuzz-wordlists)
- [Leaky-Paths](https://github.com/ayoubfathi/leaky-paths)
- [AssetNote's](https://wordlists.assetnote.io/)

### Tools
- [Interlace](https://github.com/codingo/Interlace)
- [MassDNS](https://github.com/blechschmidt/massdns)
- [Aquatone](https://github.com/michenriksen/aquatone)
- [Amass](https://github.com/OWASP/Amass)
- [Httprobe](https://github.com/tomnomnom/httprobe)
- [Anew](https://github.com/tomnomnom/anew)
- [fff](https://github.com/tomnomnom/fff)
- [Meg](https://github.com/tomnomnom/meg)
- [Ffuf](https://github.com/ffuf/ffuf)
- [AssetFinder](https://github.com/tomnomnom/assetfinder)
- [Waybackurls](https://github.com/tomnomnom/waybackurls)
- [Gron](https://github.com/tomnomnom/gron)
- [Gf](https://github.com/tomnomnom/gf)
- [Concurl](https://github.com/tomnomnom/hacks/concurl)
- [Unfurl](https://github.com/tomnomnom/unfurl)
- [Hakrawler](https://github.com/hakluke/hakrawler)
- [Subgen](https://github.com/pry0cc/subgen)
- [Dalfox](https://github.com/hahwul/dalfox)
- [Gowitness](https://github.com/sensepost/gowitness)
- [Httpx](https://github.com/projectdiscovery/httpx)
- [Naabu](https://github.com/projectdiscovery/naabu)
- [Gau](https://github.com/lc/gau)
- [Dnsx](https://github.com/projectdiscovery/dnsx/cmd/dnsx)
- [ShuffleDNS](https://github.com/projectdiscovery/shuffledns)
- [Subfinder](https://github.com/projectdiscovery/subfinder)
- [Nuclei](https://github.com/projectdiscovery/nuclei)
- [Watson](https://github.com/rasta-mouse/watson)
