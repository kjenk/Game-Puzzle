/*
 * #############################################################################
 * ############################ Include statements #############################
 * #############################################################################
 */

#include "game_puzzle.h"
#include "os_trap_wrappers.h"

/*
 * #############################################################################
 * ########################## Global data structures ###########################
 * #############################################################################
 */

/*
 * 4x4 board represented in row major order, i.e.
 *   0  1  2  3
 *   4  5  6  7
 *   8  9  10 11
 *   12 13 14 15
 */

int board[16];

/*
 * Pixel data for each tile.
 *
 * Note that the number represented by each tile is one higher than that tile's
 * index in the board.
 */

int tile_data[16][21 * 21];

/*
 * Current position of the blank tile on the board.
 */

int current_x = 3;
int current_y = 3;

/*
 * Variable used for random number generation.
 */

unsigned int random;

/*
 * #############################################################################
 * ############################### Main function ###############################
 * #############################################################################
 */

int main()
{


	// print instructions for how to play game to the user
	lc4_puts("Controls:\n");
	lc4_puts("j: left, l: right, i: up, k: down, s: scramble\n");

	initialize_board();		// sets default order of tiles on board
	initialize_tiles();		// sets color and # on each tile
	draw_board();			// draws the tiles to video display
	draw_border();

	while (1) {
		process_input();	// loop to
	}

	return 0;
	
}


/*
 * #############################################################################
 * ######################### Initialization functions ##########################
 * #############################################################################
 */

/*
 * Initializes the board to the solved configuration, i.e. 0, 1, ..., 15.
 *
 * Global variables used: board.
 *
 * Functions called: none.
 */

void initialize_board()
{
  int x;
  for(x = 0; x < 16; x++){
    board[x] = x;
  }
}

	// TO DO: initialize global array: int board[]
	//		  to default order: 1-->15

	// some pseudocode to guide you:

	/* FOR each tile on board
			board[tile] = tile ;
	   END FOR
	 */




/*
 * Initializes the pixel data of each tile.
 *
 * Background colors should be initialized to the following, where B = black,
 * R = red, and W = white:
 *   W R W R
 *   R W R W
 *   W R W R
 *   R W R B
 *
 * The tiles' digits should be initialized to the following:
 *   01 02 03 04
 *   05 06 07 08
 *   09 10 11 12
 *   13 14 15
 *
 * Hint: the tens digit and units digit of a two-digit number n can be
 * calculated as follows:
 *   tens_digit = n / 10
 *   tens_digit = n % 10
 *
 * Global variables used: tile_data.
 *
 * Functions called: initialize_tile.
 */

void initialize_tiles()
{

	/* TO DO: loop through each tile in global array: int tile_data[]
	          determine background color for each tile: (red or white)
	          determine the 2 digits to place on each tile: (01, 02, ..., 15)
	          determine color for the digits
	          once determined - call: initialize_tile() with the above info
	 */

  int column, row;
  int color;
  int tile_index, digit1, digit2;
  int pixel;
  
  for (column = 0; column < 4; column++){
    for (row = 0; row < 4; row++){
      if (((column + row) % 2) == 0){
	color = WHITE;
      }
      else{
	color = RED;
	  }

      tile_index = column + row*4;
      digit1 = (tile_index + 1) / 10;
      digit2 = (tile_index + 1) % 10;

      initialize_tile(tile_index, digit1, digit2, color, BLACK);
    }
  }
  

	/* 	some pseudocode to guide you:

	int column, row;
	int color;
	int tile_index, digit1, digit2;

	FOR each column on board
		FOR each row on board
			// calculate color for tile
			IF [(column + row) % 2] = 0 THEN color = WHITE
			ELSE color = RED

			// calculate digits for tile
			tile_index = column + row * 4
			digit1 = (tile_index + 1) / 10
			digit2 = (tile_index + 1) % 10

			// finally, call initialize tile with data calculated above
			CALL initialize_tile() with tile_index, digit1, digit2, color, BLACK
		}
	}

	// set all pixels to BLACK for blank tile
	FOR each pixel in tile
		tile_data[15][pixel] = BLACK;
	*/
    for (pixel = 0; pixel < 441; pixel++){
      tile_data[15][pixel] = BLACK;
    }
}



/*
 * Initializes the pixel data of the given tile.
 *
 * Every pixel in the tile should first be set to the background color, after
 * which the given digits should be added on top.
 *
 * Global variables used: tile_data.
 *
 * Functions called: add_digit_to_tile.
 */

void initialize_tile(int tile_index, int digit1, int digit2,
                     int bg_color, int fg_color)
{
  int pixel;
  int segment_length = 7;

	/* TO DO: using tile_index as the index for the global array: tile_data[tile_index]
			  loop through all [21*21] pixels, set background color to bg_color.
			  After background color is set, call: add_digit_to_tile() to
			  have digits: digit1 and digit2 placed on the current tile: tile_data[tile_index]
			  at the appropriate pixel offsets for where the digits should be placed on tile
	 */
  for(pixel = 0; pixel < 441; pixel++){
      tile_data[tile_index][pixel] = bg_color;
    }
    add_digit_to_tile(tile_index, digit1, fg_color, 2, 3, 7);
    add_digit_to_tile(tile_index, digit2, fg_color, 12, 3, 7);
}




/*
 * Segment data for each digit, with zeroes representing off, and ones
 * representing on.
 *
 * Recall that the ordering of segments in a seven-segment display is:
 *   top, upper-left, upper-right, middle, lower-left, lower-right, bottom.
 *
 * Hint: integers can be treated as booleans in C. See below for some
 * comparisons with Java.
 *
 *   C                             <==> Java
 *
 *   int i = 1;                    <==> boolean b = true;
 *   if (i) { do_something(); }    <==> if (b) { do_something(); }
 *
 *   while (1) { do_something(); } <==> while (true) { do_something(); }
 *
 */


int segment_data[10][7] = {
	{1, 1, 1, 0, 1, 1, 1}, // This row, represents segments needed to make the # 0
	{0, 0, 1, 0, 0, 1, 0}, // #1
	{1, 0, 1, 1, 1, 0, 1}, // #2
	{1, 0, 1, 1, 0, 1, 1}, // #3
	{0, 1, 1, 1, 0, 1, 0}, // #4
	{1, 1, 0, 1, 0, 1, 1}, // #5
	{1, 1, 0, 1, 1, 1, 1}, // #6
	{1, 0, 1, 0, 0, 1, 0}, // #7
	{1, 1, 1, 1, 1, 1, 1}, // #8
	{1, 1, 1, 1, 0, 1, 1}  // #9
};
/* note: there is nothing to change in the "segment_data" array
         all values needed to turn on the seven segments for each
         number: 0-9 have been computed for you.  It serves as
         a "lookup table" for the add_digit_to_tile() function.
 */

/*
 * Adds a seven-segment digit to the pixel data of the given tile.
 *
 * The upper-left corner of the digit is located at (x_offset, y_offset), and
 * its segments consist of the specified number of pixels.
 *
 * In order to help you avoid repetition and simplify your loops, the following
 * quantities have been computed for you at the start of the function: left_x,
 * right_x, top_y, middle_y, and bottom_y.
 *
 * Global variables used: segment_data, tile_data.
 *
 * Functions called: none.
 */

void add_digit_to_tile(int tile_index, int digit, int color,
                       int x_offset, int y_offset, int segment_length)
{
  int x;
  int start;
  int finish;
	// look carefully at "from box to tile" to see how numbers are
	// represented as 7 segments for a 21x21 tile

	// starting and stopping pixels for left and right side of segment
	int left_x = x_offset;
	int right_x = x_offset + segment_length + 1;

    // starting and stopping pixels for top, middle, and bottom segments
	int top_y = y_offset;
	int middle_y = y_offset + segment_length + 1;
	int bottom_y = y_offset + 2 * (segment_length + 1);

	/* TO DO: for the digit passed in, use global array: segment_data[digit][]
			  to determine which segments need to be colored in, to color=color.
			  Next, determine tile you are about to add a digit to using:
		      tile_index as the index for the global array: tile_data[tile_index].
		      Finally, use left_x, right_x, top_y, middle_y, bottom_y
		      to determine start and stop places within tile to draw pixels
		      for each of the 7 segments
	 */

	int topseg=(top_y-1)*21 + left_x;
	int topseg2=(top_y-1)*21 + right_x-1;

	int topleft=(top_y)*21 + left_x - 1;
	int topleft2=(middle_y-1)*21 +left_x -1;

	int topright=top_y*21+right_x-1;
	int topright2=(middle_y-1)*21 +right_x -1;

	int middleseg=(middle_y-1)*21+left_x;
	int middleseg2=(middle_y-1)*21 +right_x-1;

	int botleft=middle_y*21+left_x-1;
	int botleft2=(bottom_y-1)*21 +left_x -1;

	int botright=middle_y*21+right_x-1;
	int botright2=(bottom_y-1)*21 +right_x -1;

	int botseg=(bottom_y-1)*21+left_x;
	int botseg2=(bottom_y-1)*21 +right_x-1;
	
	if (segment_data[digit][0] == 1){
	  for (start = topseg; start < topseg2; start++){
	    tile_data[tile_index][start] = color;
	  }
	}
	if (segment_data[digit][1] == 1){
	  for (start = topleft; start < topleft2; start=start+21){
	    tile_data[tile_index][start] = color;
	  }
	}
	if (segment_data[digit][2] == 1){
	  for (start = topright; start < topright2; start=start+21){
	    tile_data[tile_index][start] = color;
	  }
	}
	if (segment_data[digit][3] == 1){
	  for (start = middleseg; start < middleseg2; start++){
	    tile_data[tile_index][start] = color;
	  }
	}
	if (segment_data[digit][4] == 1){
	  for (start = botleft; start < botleft2; start=start+21){
	    tile_data[tile_index][start] = color;
	  }
	}
	if (segment_data[digit][5] == 1){
	  for (start = botright; start < botright2; start=start+21){
	    tile_data[tile_index][start] = color;
	  }
	}
	if (segment_data[digit][6] == 1){
	  for (start = botseg; start < botseg2; start++){
	    tile_data[tile_index][start] = color;
	  }
	}
}

/*
 * #############################################################################
 * ############################# Drawing functions #############################
 * #############################################################################
 */

/*
 * Draws all tiles on the board.
 *
 * The board should be approximately centered in the display, and there should
 * be a one-pixel gap between adjacent tiles.
 *
 * Global variables used: none.
 *
 * Functions called: draw_tile.
 */

void draw_board()
{

	/* TO DO: No additional work needed for draw_board */

	int x, y;

	for(y = 0; y < 4; y++) {
		for(x = 0; x < 4; x++) {
			draw_tile(x, y);
		}
	}

}

/*
 * Draws the tile located at (x, y) on the board, where 0 <= x, y < 4.
 *
 * Global variables used: board, tile_data.
 * there should be a one-pixel gap between adjacent tiles.
 *
 * Functions called: lc4_draw_box.
 */

void draw_tile(int x, int y)
{
	// Before implementing, recall how your trap: DRAW_BOX works
	// Think about the agruments it requires
	// You will use your DRAW_BOX in this function

	/* TO DO: 1) determine which tile we are drawing 0->15: hint: x=column, y=row of game
			  2) compute the x-coordinate for upper-left corner of tile on PennSim display
			  3) compute the y-coordinate for upper-left corner of tile on PennSim display
			  4) length of the tile is easy: 21
			  5) call: lc4_draw_box(x-coordinate, y-coordinate, 21, tile_data[tile])
			  Note: This assumes you setup tile_data for the given tile!
	 */
  int tile = 4*y + x;
  int x_coor = 20 + x*22;
  int y_coor = 20 + y*22;

  lc4_draw_box(x_coor, y_coor, 21, tile_data[tile]);
}

/*
 * #############################################################################
 * ######################### Input-handling functions ##########################
 * #############################################################################
 */

/*
 * Processes user input by getting a character and doing one of the following:
 *   j: move the blank tile left
 *   l: move the blank tile right
 *   i: move the blank tile up
 *   k: move the blank tile down
 *   s: scramble then redraw the board  <--Extra credit
 *   otherwise: nothing
 *
 * Movement of the blank tile should be accomplished by swapping it with its
 * neighbor, then redrawing both affected tiles.
 *
 * Care should be taken to avoid illegal moves.
 *
 * Global variables used: board.
 *
 * Functions called: draw_tile, lc4_getc.
 *
 * Functions called for the extra credit: draw_board, scramble_board, optionally
 * lc4_putc and lc4_puts.
 */

void switch1(int x, int y, int temp){
  int temp_1;
  temp_1=tile_data[temp][x];
  tile_data[temp][x]=tile_data[y][x];
  tile_data[y][x] = temp_1;
 }


void process_input ()
{
  char g; // intialize getc to char
  int temp=current_y*4 + current_x; // formula given in previous function
  int temp1; 
  int i;

  g = lc4_getc();

  if (g =='l'){
    if (temp%4!=3){
      for(i=0;i<21*21;i++){
       	switch1 (i,temp+1,temp);
      }
      draw_tile (current_x, current_y);
      current_x=current_x+1;
      draw_tile (current_x, current_y);
    }
  }
  if (g =='j'){
    if (temp%4 != 0){ // extreme left
      for(i=0;i<21*21;i++){
       	switch1 (i,temp-1,temp); // switch
      }
      draw_tile (current_x, current_y);
      current_x=current_x-1; // update blank
      draw_tile (current_x, current_y); // drawing blank
    }
  }
  if (g =='k'){
    if (temp/4!=3){
      for(i=0;i<21*21;i++){
       	switch1 (i,temp+4,temp);
      }
      draw_tile (current_x, current_y);
      current_y = current_y+1;
      draw_tile (current_x, current_y);
    }
  }
    if (g=='i'){
    if (temp/4!=0){
      for(i=0;i<21*21;i++){
       	switch1 (i,temp-4,temp);
      }
      draw_tile (current_x, current_y);
      current_y=current_y-1;
      draw_tile (current_x, current_y);
    }
  }
}



/*
 * #############################################################################
 * ############################## Extra Credit 1 ###############################
 * #############################################################################
 */

/*
 * Draws a brown, three-pixel border around the board.
 */

void draw_border()
{
}
  

/*
 * #############################################################################
 * ############################## Extra Credit 2 ###############################
 * #############################################################################
 */

/*
 * Custom XOR definition (to be used in place of the ^ operator).
 */

#define XOR(a, b) ((~a & b) | (a & ~b))

/*
 * Returns a random unsigned integer by means of a linear feedback shift
 * register.
 *
 * Hint: use the unsigned integer named "random" defined at the beginning of the
 * file to maintain the random number generator's state in between calls.
 */

unsigned int random_int() {


  return 0;
}

/*
 * Scrambles the tiles on the board.
 */

void scramble_board()
{



}




/*
 * #############################################################################
 * ############################# Example functions #############################
 * #############################################################################
 */

/*
 * Draws a single pixel of the given color at (x, y).
 *
 * The pixel should be represented as a 1x1 box and drawn using the DRAW_BOX
 * trap wrapper.
 */

void example_function_draw_pixel(int x, int y, int color)
{

	int colors[1];					// create an array of colors to draw
	colors[0] = color;
	lc4_draw_box(x, y, 1, colors);  // calls trap, passes array of colors

}

/*
 * An example function that calls: example_function_draw_pixel() to draw a circle
 */

void example_function_draw_circle()
{

	int x, y;

	// Draws a red circle of radius 20 centered at (64, 62).

	for (x = -20; x <= 20; x++) {
		for (y = -20; y <= 20; y++) {
			if (x*x + y*y <= 20*20) {
				example_function_draw_pixel(64 + x, 62 + y, RED);
			}
		}
	}

}
