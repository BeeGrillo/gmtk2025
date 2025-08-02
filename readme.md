# Game Makers Toolkit Game Jam 2025

## About the author

Beatriz Grillo (she/her) is a software developer that builds games and toys for fun, mostly using code, sweat, and tears sometimes.
- Insta, twitter: @umaGrillo 
- BlueSky: https://bsky.app/profile/umagrillo.bsky.social
- itch.io: https://umagrillo.itch.io/
- twitch: https://www.twitch.tv/umagrillo

## Theme

Loop

### Brainstorm
- repeat game loop of gathering resources/experience and playing the game again
- compete again self finishing levels
- complete a circuit returning to the start
- Night Into Dreams (specially boss battle)
- roguelite
- objects spinning on screen to obscure action

## The Game

### Re-runner
A character is running through a loop of they own making.
On each lap, the character must collect as many tokens as possible.
Each missed token adds a new obstacle to overcome on their next lap.
Hitting an obstacle the player lose.

### Player's movements
- keeps moving forward in a fixed speed.
- can jump, stopping when jump button is released.
- can accelerate downward movement while in mid-air.
- can slide under hanging obstacles.
- can hit a token for an extra jump in mid-air.
- can accelerate brieflly on ground, moving forward on screen.
- can stand still for a brief moment, moving backward on screen.
- can jump higher if enough time standing still.

### Obstacles
- Standing: Does not move (move thoward the character at screen speed)
- Up-and-down: move up and down in a sin/cos manner
- Trap: explode on proximity, making it wider/higher
- projectile: move faster than the screen. May move upward and downward as well
- chaser: move toward character and must be avoied

### Scene
A constant race through a track that keeps repeating.
The track is divided into sections (thinking about 20).
At any given time, 2 sections (or 1 full sections and a x% of the current and a 100-x% of the next section) are on screen in the foreground.
At any given time, 8 sections are in the background, moving the oposite way as to tell what the player is to expect next.
The reminder 10 sections are hidden from camera.
The first track sections is always plain.
  BBBBBBBB
H          H
H          H
 H        H
  H      H
   H    H
     FF

### Assets
#### Character sheet
- running
- jumping
- being hit
- double jump
- slide
- standing
- high jump
- slide

#### Obstacles
- standing
- projectile
- moving
- trap untriggered
- trap triggering
- trap triggered

### MVP
A running character that jumps
Collectible token
A standing obstacle
Hit collision
Start game screen
End game screen

### DEV LOG
1- With the idea nailed down, it is time to start working. First I will k=work on defining the basic mechanic and working with geometric forms. the player is going to be a square, the obstacles are going to be a different color square. player state change are represented by color change. Make the character jump on command, reduce its speed while on air antil full stop on ground. Let's do it!!! 