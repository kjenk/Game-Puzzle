#include "os_trap_wrappers.h"
#define INPUT_SIZE 80

int main ()
{
  char x;

  lc4_puts("start typing > \n");

  while (1){

    x = lc4_getc(); // assign input to 'x'

    if (x =='\n'){ // if 'x' is return, then break loop
      break;
    }

    else{
      lc4_putc(x); // print getc
    }
  }
  return 0; 
}
