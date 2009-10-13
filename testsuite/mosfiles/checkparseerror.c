/*
 * Checks if the given error string is of length 0
 * if not, it will exit with status 1
 *
 */

#include <string.h>

int checkParseError(char *str)
{
	if(strlen(str) > 0)
		exit(1);
	return 0;
}
