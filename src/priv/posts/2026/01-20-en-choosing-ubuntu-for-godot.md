%{
    title: "Choosing Ubuntu and Zed for Godot Development",
    author: "Fabricio Damazio",
    tags: ~w(linux programming),
    description: "Time to be pragmatic."
}
---

A few months ago, I wrote an enthusiastic post about Linux ricing. Since then, I've learned a lot about Linux and how it works, and I can say without a doubt that it was the best experience I had in 2025. I quickly adapted to my new keyboard-driven workflow using Hyprland. So, why a post about adopting Ubuntu?

## Arch Linux and Hyprland – the pros and cons

Arch Linux is amazing. Everyone should use it at least once in their life. It gives you a deep understanding of how your operating system works. It's truly captivating. For me,
some things worked very well and other didn't.

### The pros

Without a doubt, Hyprland’s keyboard-focused workflow and the ease of customizing every little detail. For programming, I’ve never had a similar experience.

### The cons

Godot Engine. Don’t get me wrong, it worked fine 99% of the time, but the fact that Arch Linux uses a rolling release led me to a few unnecessary bugs (for example, related to Wayland and libdecor). Nothing critical, but it did make me waste time figuring out what the bug was and looking for workarounds. Obviously, this is my skill issue in dealing with a rolling-release distro for the first time. But these problems got me thinking about being pragmatic in my choice.

## Pragmatism

While developing with Godot, I had to make a decision: deal with the occasional issues that come with using the latest and greatest in terms of operating systems, or make a more conservative choice that prioritizes stability in my development and testing environment.

When developing a PC game in Godot, there are two main platforms you need to ensure your game runs well on: Windows and Linux.

To test my Windows builds, I reinstalled Windows 11 (sigh), and for my Linux development and testing environment, I chose Ubuntu. Yes, there are plenty of other distros that would fit here, like Fedora, Debian, etc., but I went with Ubuntu because of my familiarity with it and because I genuinely like Ubuntu’s GNOME (judge me).

Of course, I customized Ubuntu a bit to meet my needs, but I tried to keep it as vanilla as possible to have a neutral and stable environment for testing.

Another decision I made was to give the Zed editor another chance. I use the non-stable version of Neovim, and from time to time I have to do some plugin maintenance. I’ve kept Neovim as a secondary editor and moved to Zed for programming and working with Godot.

In my head, these decisions make sense, but I need to see if they’ll translate into more simplicity day-to-day.

I still love my Neovim and Arch Linux, but this year I need to be pragmatic so my plans actually work.

---
