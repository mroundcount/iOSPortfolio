Two Dimensional Game - 100 points

In this project, you will complete a simple game in which a player moves around a two-dimensional grid. 

In the game, the player can either move North, East, West, or South. The player's current position on the game grid will be defined by an (x,y) coordinate, and should be updated in a label on the screen.

- The grid size is from -2 to +2 for both x and y values. The player will start at the origin (0,0).

- When a player hits a grid boundary, the appropriate direction buttons must be disabled. 

- If a player successfully moves in a certain direction, display that in the direction message label after they move.

- At certain locations of your choosing, make some special events occur (they're just messages that will display on screen). Use a different label from the direction message label.

- If the player taps the reset button, it should look like the start position again.

This project will require you to do several things:

- build needed user interface elements in Main.storyboard

- connect those interface elements to GameViewController as IBActions and IBOutlets as appropriate


NOTES

1. Simulator: Design for the iPhone 8 in portrait mode. So, use the iPhone 8 Simulator when testing, and in Interface Builder, select "View as iPhone 8" for your storyboarding.

2. Label Size: Since Autolayout constraints are not required on this app, make sure you adjust the size of your labels on the storyboard, so when the label text gets updated, it is not truncated.

3. Game Grid Size: Leave the size of the game grid at -2 to +2 for both x and y values.

4. Special Events: The messages for special events need to be populated in GameModel, so GameViewController can read from the current location struct.


