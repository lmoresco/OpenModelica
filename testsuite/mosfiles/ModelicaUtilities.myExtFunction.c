#ifdef __cplusplus
extern "C" {
#endif

#include "ModelicaUtilities.h"

const char* myExtFunction(const char* str, double t) {
  ModelicaMessage(str);
  ModelicaFormatMessage(" was normal - this is formatted %s\n",str);
  ModelicaError(str);
  ModelicaFormatError(" was error - this is formatted error %s\n",str);
  char* buf = ModelicaAllocateString(3);
  buf[0] = 'O';
  buf[1] = 'K';
  buf[2] = '\n';
  return buf;
}

#ifdef __cplusplus
}
#endif
