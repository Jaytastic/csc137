// Jianliang Luo
// encoder8to3.v, 8-to-3 encoder, gate synthesis
// compile: D:\Sac State\CSC137\hw\1stVerilog>iverilog .\encoder8to3.v
// run: ./a.out

module EncoderMod(i0, i1, i2, i3, i4, i5, i6, i7, o2, o1, o0);
   input i0, i1, i2, i3, i4, i5, i6, i7;
   output o2, o1, o0;
   
   or(o2, i4, i5, i6, i7);
   or(o1, i2, i3, i6, i7);
   or(o0, i1, i3, i5, i7);
endmodule

module TestMod;
   reg i0, i1, i2, i3, i4, i5, i6, i7;
   wire o2, o1, o0;
   
   EncoderMod my_encoder(i0, i1, i2, i3, i4, i5, i6, i7, o2, o1, o0);
   
   initial begin
		$display("Time  i0  i1  i2  i3  i4  i5  i6  i7   o2  o1  o0");
		$display("----  ------------------------------   ----------");
		$monitor("   %0d   %b   %b   %b   %b   %b   %b   %b   %b    %b   %b   %b", $time, i0, i1, i2, i3, i4, i5, i6, i7, o2, o1, o0);
	end
	
	initial begin
		i0 = 1; i1 = 0; i2 = 0; i3 = 0; i4 = 0; i5 = 0; i6 = 0; i7 = 0;		// initially 10000000
		#1;																	// wait 1 cycle
		i0 = 0; i1 = 1; i2 = 0; i3 = 0; i4 = 0; i5 = 0; i6 = 0; i7 = 0;		// initially 01000000
		#1;																	// wait 1 cycle
		i0 = 0; i1 = 0; i2 = 1; i3 = 0; i4 = 0; i5 = 0; i6 = 0; i7 = 0;		// initially 00100000
		#1;																	// wait 1 cycle
		i0 = 0; i1 = 0; i2 = 0; i3 = 1; i4 = 0; i5 = 0; i6 = 0; i7 = 0;		// initially 00010000
		#1;																	// wait 1 cycle
		i0 = 0; i1 = 0; i2 = 0; i3 = 0; i4 = 1; i5 = 0; i6 = 0; i7 = 0;		// initially 00001000
		#1;																	// wait 1 cycle
		i0 = 0; i1 = 0; i2 = 0; i3 = 0; i4 = 0; i5 = 1; i6 = 0; i7 = 0;		// initially 00000100
		#1;																	// wait 1 cycle
		i0 = 0; i1 = 0; i2 = 0; i3 = 0; i4 = 0; i5 = 0; i6 = 1; i7 = 0;		// initially 00000010
		#1;																	// wait 1 cycle
		i0 = 0; i1 = 0; i2 = 0; i3 = 0; i4 = 0; i5 = 0; i6 = 0; i7 = 1;		// initially 00000001
		#1;			
	end// wait 1 cycle
endmodule