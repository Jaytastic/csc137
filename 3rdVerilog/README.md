Assignment
In this assignment you will write a Verilog program to simulate a 5-bit adder. Submit your program file as "adder.v"

Continue reading below for diagrams, sample output, and psuedocode of the program. 

 

Full Adder Diagrams
Single-bit
FA.png

5-bit
5BitAdder.png

 

Example Output
   atoz% demo-a.out
   Enter X: 
   02
   Enter Y: 
   05
   X = 2 (00010)  Y = 5 (00101)
   Result= 7 (00111)  C5 = 0

   atoz% demo-a.out
   Enter X: 
   17
   Enter Y: 
   19
   X = 17 (10001)  Y = 19 (10011)
   Result= 4 (00100)  C5 = 1
KeyBoard Input Example
0-EnterSomething.v

1-EnterDigit.v

2-EnterBinary.v

3-EnterStr.v

4-EOF.v

One way to do this:

 

initial begin
$display("Enter X (two digit 00~15 (since max is 01111): ");
str[1] = $fgetc(STDIN); // ASCII # of 1st digit
str[2] = $fgetc(STDIN); // ASCII # of 2nd digit
str[3] = $fgetc(STDIN); // ENTER key
X = (str[1] - 48) * 10 + str[2] - 48;

$display("Enter Y (two digit 00~15 (since max is 01111): ");
str[1] = $fgetc(STDIN); // ASCII # of 1st digit
str[2] = $fgetc(STDIN); // ASCII # of 2nd digit
str[3] = $fgetc(STDIN); // ENTER key
Y = (str[1] - 48) * 10 + str[2] - 48;

#1; // wait until add done

$display("X =%d (%b) Y =%d (%b)", X, X, Y, Y);
$display("Result =%d (%b) C5 = %b", S, S, C5);
end
