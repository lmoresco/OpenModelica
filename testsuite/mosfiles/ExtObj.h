typedef struct { /* User-defined datastructure of the table */
double* array; /* nrow*ncolumn vector */
int nrow; /* number of rows */
int ncol; /* number of columns */
int type; /* interpolation type */
int lastIndex; /* last row index for search */
} MyTable;
void* initMyTable(char* fileName, char* tableName); 
void closeMyTable(void* object); 
double interpolateMyTable(void* object, double u); 
