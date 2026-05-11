# Game Design Document – “Neon Breaker”
## 1. Game Overview

- Genre: Arcade / Brick Breaker
- Tic80
- Target Audience: Casual gamers, ages 8+, with appeal to retro arcade fans and puzzle enthusiasts.
- Game Summary:

Neon Breaker is a vibrant, cyberpunk-inspired reimagining of the classic Arkanoid formula. Players control a glowing paddle at the bottom of the screen, bouncing a luminous energy ball to shatter blocks arranged in intricate patterns. As levels progress, the game introduces new block types, power-ups, hazards, and even boss battles, blending nostalgic gameplay with modern visuals, dynamic physics, and strategic challenges.


## 2. Core Gameplay

- Primary Objective: 
    - Clear all destructible blocks in each level while preventing the ball from falling past the paddle.

- Secondary Objectives:
    - Achieve high scores by chaining combos and collecting bonus items.
    - Complete time challenges for extra rewards.

- Player Actions:
    - Move paddle horizontally to intercept the ball.
    - Launch the ball at the start of each life.
    - Collect falling power-ups and avoid hazards.
    - Strategically aim ball bounces to target specific blocks.

- Win Condition:
    - All destructible blocks cleared.

- Lose Condition: 
    - All lives depleted (ball falls past paddle too many times).

## 3. Game Mechanics

Paddle Control
- PC/Web: Arrow keys, A/D keys, or mouse movement.
- Optional Accessibility: Adjustable paddle sensitivity, slow-motion assist mode.

Ball Physics

- Ball speed increases slightly after each paddle hit or block destruction streak.
- Bounce angle determined by hit position on paddle (center = straight, edges = sharper angles).
- Special blocks and bosses can alter ball trajectory.

Block Types

1. Standard Block – 1 hit to destroy.
2. Reinforced Block – 2–3 hits, changes color as it weakens.
3. Explosive Block – Destroys surrounding blocks in a small radius.
4. Indestructible Block – Permanent obstacle, forces strategic ball angles.
5. Moving Block – Slides horizontally or vertically, increasing difficulty.
6. Power Core Block – Releases a guaranteed power-up when destroyed.

Power-Ups

- Expand Paddle – Increases paddle width temporarily.
- Multi-Ball – Splits ball into 3, all active simultaneously.
- Laser Paddle – Fires projectiles to destroy blocks directly.
- Slow Ball – Temporarily reduces ball speed for precision shots.
- Extra Life – Adds one life to player’s total.
- Magnet Paddle – Ball sticks to paddle until released.

Hazards

- Shrink Paddle – Reduces paddle width.
- Speed Up Ball – Increases ball velocity dramatically.
- Reverse Controls – Temporarily inverts paddle movement.
- Dark Screen – Briefly dims the play area, making tracking harder.

##4. Level Design

- Total Levels: 50 main levels + 5 bonus challenge stages.
- Difficulty Curve: Gradual introduction of new mechanics, faster ball speeds, and more complex block arrangements.
- Themes:
- Level 1–10: Neon City Streets (basic blocks, slow speed)
- Level 11–20: Cyber Factory (moving blocks, reinforced blocks)
- Level 21–30: Data Core (explosive blocks, hazards)
- Level 31–40: Quantum Void (indestructible blocks, multi-ball chaos)
- Level 41–50: AI Citadel (boss fights, mixed hazards)

Boss Levels

- Appear every 10th level.
- Bosses are large, moving entities with health bars.
- Attack patterns include shooting projectiles, spawning hazards, and altering ball speed.
- Defeating a boss clears the level instantly.

## 5. Visual & Audio Style
Art Style

- Neon cyberpunk aesthetic with glowing outlines, particle effects, and animated backgrounds.
- Blocks pulse with light when hit, and power-ups emit trails.
- Paddle and ball have customizable skins.

