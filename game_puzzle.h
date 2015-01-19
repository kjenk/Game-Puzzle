/*
 * game_puzzle.h
 */

/*
 * #############################################################################
 * ################################ Constants ##################################
 * #############################################################################
 */

#define BLACK  0x0000
#define WHITE  0x7FFF

#define BROWN  0x34C0
#define RED    0x7C00
#define ORANGE 0x7600
#define YELLOW 0x7FF0
#define GREEN  0x3300
#define CYAN   0x0770
#define BLUE   0x0033
#define PURPLE 0x7C3F

/*
 * #############################################################################
 * ########################## Function declarations ############################
 * #############################################################################
 */


/* Initialization functions */

void initialize_board();
void initialize_tiles();
void initialize_tile(int tile_index, int digit1, int digit2,
                     int bg_color, int fg_color);
void add_digit_to_tile(int tile_index, int digit, int color,
                       int x_offset, int y_offset, int segment_length);

/* Drawing functions */

void draw_border();
void draw_board();
void draw_tile(int x, int y);

/* Input-handling functions */

void process_input();
void scramble_board();

/* Example functions */

void example_function_draw_pixel(int x, int y, int color);
void example_function_draw_circle();
