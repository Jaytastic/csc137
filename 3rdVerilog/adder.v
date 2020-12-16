//	Jianliang Luo
//	adder.v, 137 Verilog Programming Assignment
module TestMod;		// the "main" thing
	parameter STDIN = 32'h8000_0000;	// I/O address of keyboard input channel

	reg [7:0] str [1:3];				// typing in 2 chars at a time (decimal # and Enter key)
	reg [4:0] X, Y;						// 5-bit X, Y to sum
	wire [4:0] S;						// 5-bit Sum to see as result
	wire C5; 							// like to know this as well from result of adder

	// instantitate the big adder module (giving X and Y as input, getting S and C5 as output)

	BigAdder bigAdder(X, Y, S, C5);

	initial begin
		$display("Enter X: ");		// prompt for entering X
		str[1] = $fgetc(STDIN);		// get 1st character
		str[2] = $fgetc(STDIN);		// get 2nd character
		str[3] = $fgetc(STDIN);		// and the ENTER key

		// convert str to a value for X:
		X = (str[1] - 48) * 10 + (str[2] - 48);		// str[1] - 48 first, then times 10, then + str[2] - 48
		
		// do the above to get and convert it to Y
		$display("Enter Y: ");
      	str[1] = $fgetc(STDIN); // get 1st character
      	str[2] = $fgetc(STDIN); // get 2nd character
      	str[3] = $fgetc(STDIN); // and the ENTER key

		Y = (str[1] - 48) * 10 + (str[2] - 48);		// convert str to value for Y

		#1; // wait until adder gets them processed
		$display("X = %d (%b)	Y = %d (%b)", X, X, Y, Y);	// $display X and Y (run demo to see display format)
		$display("Result = %d (%b)	C5 = %b", S, S, C5);	// $display S and C5 (run demo to see display format)
	end
endmodule


module BigAdder(X, Y, S, C5);
	input [4:0] X, Y;		// two 5-bit input items
	output [4:0] S;			// S should be similar
	output C5;				// another output for a different size

	wire C0 = 0;			// 0 for ADD
	wire C1, C2, C3, C4;	// declare temporary wires

	FullAdderMod FA0(X[0], Y[0], C0, S[0], C1);
   	FullAdderMod FA1(X[1], Y[1], C1, S[1], C2);
   	FullAdderMod FA2(X[2], Y[2], C2, S[2], C3);
   	FullAdderMod FA3(X[3], Y[3], C3, S[3], C4);
   	FullAdderMod FA4(X[4], Y[4], C4, S[4], C5);
endmodule


module FullAdderMod(X, Y, Cin, S, Cout);	// single-bit adder module
	input X, Y, Cin;
	output S, Cout;

	wire AND0, AND1, XOR0;

	and(AND0, X, Y);
	and(AND1, Cin, XOR0);
	xor(XOR0, X, Y);

	xor(S, Cin, XOR0);		// Sum bit
	or(Cout, AND1, AND0);	// Carry out bit
endmodule