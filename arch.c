#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
  int is__MACH__ = 0, is__UNIX__ = 0, is__LINUX__ = 0;
  
#ifdef __APPLE__
  is__MACH__ = 1;
#endif
#ifdef __LINUX__
  is__LINUX__ = 1;
#endif
  is__UNIX__ = ! (is__MACH__ || is__LINUX__);

  printf("; Generated from %s\n", argv[0]);
  printf("(define __MACH__  '(%s))	; non-nil for Darwin / Mac OS X   (deal with the convoluted ABI)\n", is__MACH__ ? "X" : " ");
  printf("(define __UNIX__  '(%s))	; nin-nil for Unix, MinGW, etc.   (external symbols have underscore prefix)\n", is__UNIX__ ? "X" : " ");
  printf("(define __LINUX__ '(%s))	; non-nil for Linux, Cygwin, etc. (external symbols have no underscore prefix)\n", is__LINUX__ ? "X" : " ");
  return 0;
}
