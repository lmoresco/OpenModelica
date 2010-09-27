#include <stdio.h>
#include <stdlib.h>
#include <sqlite3.h>

#define MAX 500000

static int callback(void *NotUsed, int argc, char **argv, char **azColName){
  int i;
  for(i=0; i<argc; i++){
    printf("%s = %s\n", azColName[i], argv[i] ? argv[i] : "NULL");
  }
  printf("\n");
  return 0;
}

int openDB(sqlite3 **db, const char* name)
{
  char *zErrMsg = 0;
  int rc;
  rc = sqlite3_open(name, db);
  if( rc ) {
    fprintf(stderr, "Can't open database: %s\n", sqlite3_errmsg(*db));
    sqlite3_close(*db);
    exit(1);
  }
}

int sendSql(sqlite3 *db, char* sqlStatement)
{
  char *zErrMsg = 0;
  int rc;
  rc = sqlite3_exec(db, sqlStatement, callback, 0, &zErrMsg);
  if( rc != SQLITE_OK ){
    fprintf(stderr, "SQL error: %s\n", zErrMsg);
    sqlite3_free(zErrMsg);
    sqlite3_close(db);
    exit(1);
  }
  return rc;
}

int main(int argc, char **argv){
  sqlite3 *db;
  char sqlStatement[500];
  int i;

  if( argc!=2 ){
    fprintf(stderr, "Usage: %s DATABASE\n", argv[0]);
    exit(1);
  }
  /* open the db, exit if error */
  openDB(&db, argv[1]);

  //sendSql(db, "PRAGMA journal_mode=DELETE;");
  //sendSql(db, "PRAGMA synchronous=OFF;");

  /* create a table */
  sendSql(db, "create table if not exists DAE(id integer not null, value real not null);");

  /* delete the values */
  sendSql(db, "delete from DAE;");

  /* do a stress test */
  sendSql(db, "begin transaction;");
  for (i=0; i <= MAX; i++)
  {
    sprintf(sqlStatement, "insert into DAE values(%d, %g);", i, (double)i);
    sendSql(db, sqlStatement);
  }
  sendSql(db, "end transaction;");
  sendSql(db, "select max(value) from DAE;");

  sqlite3_close(db);
  return 0;
}
