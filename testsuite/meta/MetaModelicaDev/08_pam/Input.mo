package Input

public function read
  output Integer outInteger;

  external "C" outInteger = getchar();
end read;
end Input;

