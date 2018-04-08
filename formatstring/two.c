
//cc -o one -mpreferred-stack-boundary=2 -m32 -fno-stack-protector -zexecstack -fno-pie one.c
#include <stdio.h>
//view string value of memory x/1s <mem location>
int main(int argc, const char *argv[])
{
  char *secret = "this is a secret one!";
  char *secret2 = "this is a secret2!";
  printf("print this: %s\n", argv[1]);
  
  return 0;
}
