

void main(int argc, array argv)
{
  foreach(argv[1..], string fn)
  {
    string test = ((fn/"/")[-1]/".")[0];
    array data = Stdio.read_file(fn)/"\n";
    string status;
    array(string) keywords;
    int i=1, cl = 0;

    write("Changing "+test+"...");
    while(!cl && i < sizeof(data))
    {
      array a;
      if (a = Regexp("^// classification: (.*)-(.*)$")->split(data[i]))
      {
	status = a[1];
	keywords = a[0]/"&";
	cl = i;
      }
      i++;
    }

    if(status)
    {
      write("yes\n");
      rm(fn);
      Stdio.write_file(fn,
		       "// name:     "+test+"\n"
		       "// keywords: "+keywords*","+"\n"
		       "// status:   "+status+"\n"
		       "// \n"+
		       data[..cl-1]*"\n"+"\n"+
		       data[cl+1..]*"\n");
    }
    else
      write("no\n");
  }
}
