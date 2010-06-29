#include <stdio.h>

void* constructor(char* filename)
{
  printf("constructors says '%s'\n", filename);
  return filename;
}

void destructor(void* o)
{
  printf("destructor says '%s'\n", (char*)o);
}
