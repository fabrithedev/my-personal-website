%{
    title: "Devlog 00: Project Bellinha, from paper to prototype",
    author: "Fabricio Damazio",
    tags: ~w(devlog gamedev),
    description: "Getting the idea for my \"first\" game off the ground."
}
---

Around the middle of last year, my pet cat, Bellinha, passed away. She was about 13 years old and had been sick. Losing a pet is never easy. They become part of our everyday lives, and losing them leaves an empty space behind. It is a truly difficult experience.

Some time after that, I started thinking about a new project. A game about the relationship between a boy and his cat. Little by little, I started documenting ideas without much commitment, and those loose notes gradually became more structured until they turned into a small game design document.

Project Bellinha is still at the beginning. Some ideas are already well defined, others are still being tested, and a lot will probably change before it becomes a complete game. This devlog exists to record that process: the decisions, the prototype, the mistakes, and the small discoveries along the way.

***IMPORTANT: I am looking for someone to handle concept art/art direction for this project. This is paid freelance work and must fit within my available budget***.

# **Project Bellinha**

It is a 3D narrative game project about connection, memory, and care. The idea is to build a short, contemplative, and emotional experience, with a certain degree of exploration and puzzles integrated into the world. I want to tell the story of the relationship between a boy and his cat, drawing from my personal experience with grief.

The visual style should be simple low-poly (I want to try learning and creating at least part of the assets myself). The player's view will be fixed in an isometric perspective at around 45 degrees with a low FOV (in the style of Tunic). It does not make sense to aim for extremely elaborate graphics, because I still do not have the necessary skill or enough budget for that.

I am developing this project in my free time, and I believe it will take me around two years to make it the way I want. I have already set aside a budget for occasional hiring in art, audio, marketing, and localization. The budget is small because this money will come directly from my own savings.

# Current goal: prototype

The first phase of development is a playable prototype of the game's first area. This area works as an organic tutorial that needs to introduce movement, jumping, interaction, dialogue, exploration, item collection, and the first puzzles. All of that without relying on long tutorials or explanations outside the game world.

The entire prototype still uses temporary placeholder assets and simple shapes. Before thinking about final art, soundtrack, trailer, or store page, I need to find out whether the foundation of the game works. The character needs to feel good to control, the camera needs to frame the spaces well, the interactions need to be clear, and the world needs to start communicating the right feeling even while using placeholders.

This prototype, along with playtest sessions, is how I intend to validate all of that.

# What exists today

So far, the foundation has already started to move from paper into reality. I created the project in Godot, and I already have movement, jumping, camera, interaction, and dialogue working in an initial form. I also started the blockout of the first area, still using simple shapes and temporary assets. Visually, it is still not exactly pretty:

<p align="center">
    <img src="/images/posts/2026/04-30-bellinha1.png" alt="Godot Engine editor with the blockout of the game's first area" width="384" height="544">
</p>

For the camera, dialogue, and interaction systems, I decided not to use any plugins. Since they are simple and very specific to this game, I decided to create them from scratch.

The player already moves in 3D with smooth acceleration and deceleration. Jumping is also already implemented with a few game feel adjustments, such as coyote time and jump buffer. They are small details, but they make a big difference in making the controls feel less rigid.

The fixed camera is also already working. It smoothly follows the player, respects area boundaries, and supports zoom controlled by script. One important decision was to use perspective with a low FOV instead of a real orthographic camera. This way, I can keep a look similar to isometric while still benefiting from better lighting and shadows in Godot.

In addition, the interaction system already exists. The player detects nearby objects, sees a contextual prompt, and can interact with examinable objects, collectible items, and NPCs.

The dialogue system has a text box, character name, typing effect, input-based progression, and movement lock while dialogue is active. It also supports events triggered by lines of dialogue, which will be important for actions such as delivering items and opening paths. The video below shows a bit of the interaction with an NPC and the dialogue system:

<video width="1024" height="768" controls>
  <source src="/images/posts/2026/04-30-bellinha1.mp4" type="video/mp4">
      Your browser does not support the video tag.
</video>

The first area will serve as a laboratory for the rest of the game. It needs to teach movement, jumping, interaction, and environmental reading without relying on tutorials or obvious hints. It is also where I start testing how a space can carry emotion without needing to explain everything through text. Internally, this area has a very specific emotional theme, which I intend to talk more about in future posts.

# Next steps

The next step is to keep closing out the blockout of the first area and test whether the path makes sense from beginning to end. After that come the area-specific mechanics, the puzzles, and the first collectible items. All of this with placeholder graphics.

This first post is less about showing a finished game and more about marking the starting point. Bellinha is still in a very early stage, but now there is already something to test, adjust, and improve. I still have not talked much about the story and the characters, because there are many loose ends and open decisions. In the next devlogs, I will bring more details.

---
