# emptyString - Max Millar, Frank Chen, Daniel Jiang

## Minesweeper

This project is a recreation of the popular computer game minesweeper using processing. It will follow the basic rules of the original game; to beat a level, the player must either clear the entire board without being blown up or mark the locations of all the mines.

## Rules

0. Left-click to reveal a space. Right click to mark a space that you deduce is a mine.
1. Click(left) a random space on the board. This will reveal the surrounding blocks. Some blocks are blank spaces; these have no mines around them. Others have numbers which indicate how many mines are adjacent to them.
2. Using this information, try to clear the entire board by either marking all the mines, or revealing all the spaces without a mine.
3. Stepping on a mine will end the game and reveal the position of all the mines. Goodluck have fun. :)

## For the not casual users

The game will be run using two classes, tentatively named Driver and Square. To put briefly, the Driver class oversees all the core functions such as the creation of the board, user interaction(mouseclicks), and revealing whitespace. Square on the otherhand is tasked with the visual functions such as loading in the mines and marking spaces with flags