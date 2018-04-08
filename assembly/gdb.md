###find variables
  i variables
####length print size
HelloWorld:
  .ascii "Hello Worlds"
  x /12cb 0x00002008->cb
  s string 
  c character
  d decimal
  x hex
  x/s -> prints the string 
  x/1dh ->half word prints numeric value 
x/5dw 0x0000201f -> display an array
x/1dh &int16 --> value in a variable
frame to find current line 
x/1db byte location
p/d print integer
x/1s print string in a memory location
& to print variables [$]eax to print regs
x/1s prints string value in &

