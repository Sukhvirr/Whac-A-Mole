// Will take the counter clock and divider to get the final output
// on the seven segment display based on the value of the counter
// which is split into two single digit numbers to make it easier to decode

module gameProject (clock, clock1, buttons, hex0, hex1, hex2, hex3, hex4, hex5);

//initialize variables
input clock;
input clock1;
input [1:0] buttons; // assigns buttons as a 2 bit input- represents the buttons used for pausing and restarting

wire outclock;
wire [4 : 0] counter; // wires counter from "counter" module as an output to an input
wire [3 : 0] ones, tens; // wires ones and tens from "split" module as an output to an input

wire reset;
assign reset = buttons[0]; // button0 set to reset button

output [7 : 0] hex0; // assign hex4 as an 8 bit output- used for the display
output [7 : 0] hex1; // assign hex5 as an 8 bit output- used for the display
output [7 : 0] hex2; // assign hex2 as an 8 bit output- used for the display
output [7 : 0] hex3; // assign hex3 as an 8 bit output- used for the display
output [7 : 0] hex4; // assign hex4 as an 8 bit output- used for the display
output [7 : 0] hex5; // assign hex5 as an 8 bit output- used for the display

wire [3:0] score;

ClockDivider myClockDivider(clock, outclock); // instantiates clockdivider module
downCounter myDownCounter(outclock, counter, reset, score, , ); // instantiates counter module

scoreDisplay myDisplay(score, hex0);

Blinker myBlinker(counter, ones, tens); // instantiates split module


ClockDivider myClockDivider1(clock1, outclock1);
assign hex2 = 8'b111_111_11;
assign hex3 = 8'b111_111_11;
assign hex1 = 8'b111_111_11;


// Translate unit value to HEX Display (HEX[0][n]) using splitting module (As per lab 2+3)

assign hex4[0] = ~((~ones[3] & ~ones[2] & ones[1] & ~ones[0]) | (~ones[3] & ~ones[2] & ones[1] & ones[0]) | (~ones[3] & ones[2] & ~ones[1] & ones[0]) | (~ones[3] & ones[2] & ones[1] & ~ones[0]) | (~ones[3] & ones[2] & ones[1] & ones[0]) | (ones[3] & ~ones[2] & ~ones[1] & ~ones[0]) | (ones[3] & ~ones[2] & ~ones[1] & ones[0]) | (ones[3] & ~ones[2] & ones[1] & ~ones[0]) | (ones[3] & ones[2] & ~ones[1] & ~ones[0]) | (ones[3] & ones[2] & ones[1] & ~ones[0]) | (ones[3] & ones[2] & ones[1] & ones[0]) | (~ones[3] & ~ones[2] & ~ones[1] & ~ones[0]));
assign hex4[1] = ~((~ones[3] & ~ones[2] & ~ones[1] & ones[0]) | (~ones[3] & ~ones[2] & ones[1] & ~ones[0]) | (~ones[3] & ~ones[2] & ones[1] & ones[0]) | (~ones[3] & ones[2] & ~ones[1] & ~ones[0]) | (~ones[3] & ones[2] & ones[1] & ones[0]) | (ones[3] & ~ones[2] & ~ones[1] & ~ones[0]) | (ones[3] & ~ones[2] & ~ones[1] & ones[0]) | (ones[3] & ~ones[2] & ones[1] & ~ones[0]) | (ones[3] & ones[2] & ~ones[1] & ones[0]) | (~ones[3] & ~ones[2] & ~ones[1] & ~ones[0]));
assign hex4[2] = ~((~ones[3] & ~ones[2] & ~ones[1] & ones[0]) | (~ones[3] & ~ones[2] & ones[1] & ones[0]) | (~ones[3] & ones[2] & ~ones[1] & ~ones[0]) | (~ones[3] & ones[2] & ~ones[1] & ones[0]) | (~ones[3] & ones[2] & ones[1] & ~ones[0]) | (~ones[3] & ones[2] & ones[1] & ones[0]) | (ones[3] & ~ones[2] & ~ones[1] & ~ones[0]) | (ones[3] & ~ones[2] & ~ones[1] & ones[0]) | (ones[3] & ~ones[2] & ones[1] & ~ones[0]) | (ones[3] & ~ones[2] & ones[1] & ones[0]) | (ones[3] & ones[2] & ~ones[1] & ones[0]) | (~ones[3] & ~ones[2] & ~ones[1] & ~ones[0]));
assign hex4[3] = ~((~ones[3] & ~ones[2] & ones[1] & ~ones[0]) | (~ones[3] & ~ones[2] & ones[1] & ones[0]) | (~ones[3] & ones[2] & ~ones[1] & ones[0]) | (~ones[3] & ones[2] & ones[1] & ~ones[0]) | (ones[3] & ~ones[2] & ~ones[1] & ~ones[0]) | (ones[3] & ~ones[2] & ~ones[1] & ones[0]) | (ones[3] & ~ones[2] & ones[1] & ones[0]) | (ones[3] & ones[2] & ~ones[1] & ~ones[0]) | (ones[3] & ones[2] & ~ones[1] & ones[0]) | (ones[3] & ones[2] & ones[1] & ~ones[0]) | (~ones[3] & ~ones[2] & ~ones[1] & ~ones[0]));
assign hex4[4] = ~((~ones[3] & ~ones[2] & ones[1] & ~ones[0]) | (~ones[3] & ones[2] & ones[1] & ~ones[0]) | (ones[3] & ~ones[2] & ~ones[1] & ~ones[0]) | (ones[3] & ~ones[2] & ones[1] & ~ones[0]) | (ones[3] & ~ones[2] & ones[1] & ones[0]) | (ones[3] & ones[2] & ~ones[1] & ~ones[0]) | (ones[3] & ones[2] & ~ones[1] & ones[0]) | (ones[3] & ones[2] & ones[1] & ~ones[0]) | (ones[3] & ones[2] & ones[1] & ones[0]) | (~ones[3] & ~ones[2] & ~ones[1] & ~ones[0]));
assign hex4[5] = ~((~ones[3] & ones[2] & ~ones[1] & ~ones[0]) | (~ones[3] & ones[2] & ~ones[1] & ones[0]) | (~ones[3] & ones[2] & ones[1] & ~ones[0]) | (ones[3] & ~ones[2] & ~ones[1] & ~ones[0]) | (ones[3] & ~ones[2] & ~ones[1] & ones[0]) | (ones[3] & ~ones[2] & ones[1] & ~ones[0]) | (ones[3] & ~ones[2] & ones[1] & ones[0]) | (ones[3] & ones[2] & ~ones[1] & ~ones[0]) | (ones[3] & ones[2] & ones[1] & ~ones[0]) | (ones[3] & ones[2] & ones[1] & ones[0]) | (~ones[3] & ~ones[2] & ~ones[1] & ~ones[0]));
assign hex4[6] = (~ones[3] & ~ones[2] & ~ones[1]) | (~ones[3] & ones[2] & ones[1] & ones[0]) | (ones[3] & ones[2] & ~ones[1] & ~ones[0]);
assign hex4[7] = (counter == 0) ? ((outclock1 % 2) & 1'b1) : 1'b1;

// Translate tens value to HEX Display (HEX[1][n]) using splitting module (As per lab 2+3)

assign hex5[0] = ~((~tens[3] & ~tens[2] & tens[1] & ~tens[0]) | (~tens[3] & ~tens[2] & tens[1] & tens[0]) | (~tens[3] & tens[2] & ~tens[1] & tens[0]) | (~tens[3] & tens[2] & tens[1] & ~tens[0]) | (~tens[3] & tens[2] & tens[1] & tens[0]) | (tens[3] & ~tens[2] & ~tens[1] & ~tens[0]) | (tens[3] & ~tens[2] & ~tens[1] & tens[0]) | (tens[3] & ~tens[2] & tens[1] & ~tens[0]) | (tens[3] & tens[2] & ~tens[1] & ~tens[0]) | (tens[3] & tens[2] & tens[1] & ~tens[0]) | (tens[3] & tens[2] & tens[1] & tens[0]));
assign hex5[1] = ~((~tens[3] & ~tens[2] & ~tens[1] & tens[0]) | (~tens[3] & ~tens[2] & tens[1] & ~tens[0]) | (~tens[3] & ~tens[2] & tens[1] & tens[0]) | (~tens[3] & tens[2] & ~tens[1] & ~tens[0]) | (~tens[3] & tens[2] & tens[1] & tens[0]) | (tens[3] & ~tens[2] & ~tens[1] & ~tens[0]) | (tens[3] & ~tens[2] & ~tens[1] & tens[0]) | (tens[3] & ~tens[2] & tens[1] & ~tens[0]) | (tens[3] & tens[2] & ~tens[1] & tens[0]));
assign hex5[2] = ~((~tens[3] & ~tens[2] & ~tens[1] & tens[0]) | (~tens[3] & ~tens[2] & tens[1] & tens[0]) | (~tens[3] & tens[2] & ~tens[1] & ~tens[0]) | (~tens[3] & tens[2] & ~tens[1] & tens[0]) | (~tens[3] & tens[2] & tens[1] & ~tens[0]) | (~tens[3] & tens[2] & tens[1] & tens[0]) | (tens[3] & ~tens[2] & ~tens[1] & ~tens[0]) | (tens[3] & ~tens[2] & ~tens[1] & tens[0]) | (tens[3] & ~tens[2] & tens[1] & ~tens[0]) | (tens[3] & ~tens[2] & tens[1] & tens[0]) | (tens[3] & tens[2] & ~tens[1] & tens[0]));
assign hex5[3] = ~((~tens[3] & ~tens[2] & tens[1] & ~tens[0]) | (~tens[3] & ~tens[2] & tens[1] & tens[0]) | (~tens[3] & tens[2] & ~tens[1] & tens[0]) | (~tens[3] & tens[2] & tens[1] & ~tens[0]) | (tens[3] & ~tens[2] & ~tens[1] & ~tens[0]) | (tens[3] & ~tens[2] & ~tens[1] & tens[0]) | (tens[3] & ~tens[2] & tens[1] & tens[0]) | (tens[3] & tens[2] & ~tens[1] & ~tens[0]) | (tens[3] & tens[2] & ~tens[1] & tens[0]) | (tens[3] & tens[2] & tens[1] & ~tens[0]));
assign hex5[4] = ~((~tens[3] & ~tens[2] & tens[1] & ~tens[0]) | (~tens[3] & tens[2] & tens[1] & ~tens[0]) | (tens[3] & ~tens[2] & ~tens[1] & ~tens[0]) | (tens[3] & ~tens[2] & tens[1] & ~tens[0]) | (tens[3] & ~tens[2] & tens[1] & tens[0]) | (tens[3] & tens[2] & ~tens[1] & ~tens[0]) | (tens[3] & tens[2] & ~tens[1] & tens[0]) | (tens[3] & tens[2] & tens[1] & ~tens[0]) | (tens[3] & tens[2] & tens[1] & tens[0]));
assign hex5[5] = ~((~tens[3] & tens[2] & ~tens[1] & ~tens[0]) | (~tens[3] & tens[2] & ~tens[1] & tens[0]) | (~tens[3] & tens[2] & tens[1] & ~tens[0]) | (tens[3] & ~tens[2] & ~tens[1] & ~tens[0]) | (tens[3] & ~tens[2] & ~tens[1] & tens[0]) | (tens[3] & ~tens[2] & tens[1] & ~tens[0]) | (tens[3] & ~tens[2] & tens[1] & tens[0]) | (tens[3] & tens[2] & ~tens[1] & ~tens[0]) | (tens[3] & tens[2] & tens[1] & ~tens[0]) | (tens[3] & tens[2] & tens[1] & tens[0]));
assign hex5[6] = (~tens[3] & ~tens[2] & ~tens[1]) | (~tens[3] & tens[2] & tens[1] & tens[0]) | (tens[3] & tens[2] & ~tens[1] & ~tens[0]);
assign hex5[7] = 1;



endmodule



module ClockDivider(cin,cout);

// Slightly modified version of the clock divider code provided in the lab 4 instructions. 


input cin;
output reg cout;
 
reg[31:0] count; 
parameter D = 32'd12500000;

always @(posedge cin) begin
count <= count + 32'd1; // increment clock register by 1 per rising edge
if (count >= (D-1)) begin // check if 25 000 000 clock cycles reached

cout <= ~cout; //once countdown reaches its end, divide cout by 2, essentially creating a 2x faster clock using the original cout and clock function.
count <= 32'd0; //resets count to 0
end
end
endmodule


module downCounter(clock, counter, button1, scorefinal, sw, LED);

// Module responsible for the actual countdown. It also detects if reset or pause button is pressed.
//If reset pressed, re-assign starting countdown value. 
//If pause is pressed, cease counting down and continue displaying paused value.

//input [1:0] button1;
input button1;
input clock;
input [9:0] sw;
output reg [9:0] LED;
//wire reset;
//assign reset = button1[0];
//wire reset2;
//assign reset2 = button1[1];
reg countdown = 1; //start countdown from 1 (automatically starts counting down when program is run)
 
output reg [7:0] counter;
output wire [3:0] scorefinal;
reg [3:0] score;

assign scorefinal = score;

reg [5:0] current = 0;
reg [5:0] next = 0;


initial begin
counter <= 7'd20; // set starting countdown value to 20.
end


   always @(posedge clock or posedge button1) begin // executes when reset signal transitions from 1 to 0    

if(button1) begin // checks if reset = 0 (reset button pressed)
counter <= 20; // if reset = 0, reset button sets timer to 20

//current <= 6'b000000;
end

else if(countdown & counter > 0) begin // "countdown" controls if the countdown is active.
counter <= counter - 1; // if both conditions are met, decrease counter by 1.
end

//current <= next;


end


//wack a mole game section

always @ (posedge clock or posedge button1) begin
	if(button1) begin
	
		current <= 6'b000000;
		
	end else begin
		
		current <= next;
	end
	end
	
	//buffer
	always @ (posedge clock or posedge button1) begin
	
	end
	
   
	always @ (current, sw[9:0], counter) begin
	//if(countdown & counter > 0) begin
	
		case(current)
	
	6'b000000: begin	
		next <= 6'b000000;
		LED[9:0] <= 0; //all LEDs off
		score <= 4'b0000;
		
			LED[2] <= 1;

		
		if (sw[2]) begin //if the correct switch is pressed
			next <= 6'b000001;
			score <= 4'b0001;
			end
		else
			next <= 6'b000000;
		
	end
	
	6'b000001: begin
	
		LED[9:0] <= 0; //LEDs off
		
		LED[4] <= 1;
		
		if (sw[4]) begin//if the correct switch is pressed
			next <= 6'b000010; //next state of 2
			score <= 4'b0010;
			end
		else
			next <= 000001; //to the previous state of 1
end

	6'b000010: begin
		LED[9:0] <= 0;
		
		LED [1] <= 1;
		
		if (sw[1]) begin
			next <= 6'b000011;
			score <= 4'b0011;
			end
		else
			next <= 6'b000010;
	end
	
	6'b000011: begin
		LED[9:0] <= 0;
		
		LED[3] <= 1;
		
		if (sw[3]) begin
			next <= 6'b000100;
			score <= 4'b0100;
			end
		else
			next <= 6'b000011;
	end
	
	6'b000100: begin
		LED[9:0] <= 0;
		
		LED[5] <= 1;
		
		if(sw[5]) begin
			next <= 6'b000101;
			score <= 4'b0101;
			end
		else
			next <= 6'b000100;
	end
	
	6'b000101: begin
		LED[9:0] <= 0;
		LED[0] <= 1;
		
		if(sw[0]) begin
			next <= 6'b000110;
			score <= 4'b0110;
			end
		else
			next <= 6'b000101;
		
	end
	
	6'b000110: begin
		LED[9:0] <= 0;
		LED[6] <= 1;
		
		if(sw[6]) begin
			next <= 6'b000111;
			score <= 4'b0111;
			end
		else
			next <= 6'b000110;
	end
	
	6'b000111: begin
		LED[9:0] <= 0;
		LED[7] <= 1;
		
		if(sw[7]) begin
			next <= 6'b001000;
			score <= 4'b1000;
			end
		else
			next <= 6'b000111;
	end
	
	6'b001000: begin
		LED[9:0] <= 0;
		LED[9] <= 1;
		
		if(sw[9]) begin
			next <= 6'b001001;
			score <= 4'b1001;
			end
		else
			next <= 6'b001000;
	end
	
	6'b001001: begin
		LED[9:0] <= 0;
		LED[8] <= 1;
		
		if(sw[8]) begin
			next <= 6'b001010;
			score <= 4'b1010;
			end
		else
			next <= 6'b001001;		
	end
	
	6'b001010: begin
		LED[9:0] <= 0;
		LED[1] <= 1;
		
		if(sw[1]) begin
			next <= 6'b001011;
			score <= 4'b1011;
			end
		else
			next <= 6'b001010;
	end
	
	6'b001011: begin
		LED[9:0] <= 0;
		LED[5] <= 1;
		
		if(sw[5]) begin
			next <= 6'b001110;
			score <= 4'b1100;
			end
		else
			next <= 6'b001100;
	end

	6'b001100: begin
		LED[9:0] <= 0;
		LED[9] <= 1;
		
		if(sw[9]) begin
			next <= 6'b001101;
			score <= 4'b1101;
			end
		else
			next <= 6'b001100;
	end
	
	6'b001101: begin
		LED[9:0] <= 0;
		LED[3] <= 1;
		
		if(sw[3]) begin
			next <= 6'b001110;
			score <= 4'b1110;
			end
		else
			next <= 6'b001101;
	end
	
	6'b001110: begin
		LED[9:0] <= 0;
		LED[0] <= 1;
		
		if(sw[0]) begin
			next <= 6'b001111;
			score <= 4'b1111;
			end
		else
			next <= 6'b001110;
	end
	
	6'b001111: begin //max score reached, all LEDs off, no more counting.
		score <= 6'b001111;
		next <= 6'b001111;
		LED[9:0] <= 0;
	end	
	
	default: begin	next <= 6'b000000;
	end
	
	endcase
	
	end

	
endmodule


module scoreDisplay(score,f);

input wire [3:0] score; //input initialization (a,b,c,d represents rightmost switches, with a being sw3, the most significant bit).
output wire [6:0] f; //output set to a multi-lane wire (0-6 to represent the 7 hex[0][x] LEDs later)
reg [6:0] segment;

assign f = segment; //assign the made output the actual mult-lane wire display. (hex[0][0-6])

always @(score) //continuously check the inputs (4 rightmost switches) for any changes in state (on or off).
begin
    case(score)

    4'b0000: segment = 7'h40;//each case corresponds to a digit in hex. eg. 40 = all segments on except section 6, which displays as "0".
    4'b0001: segment = 7'h79;// 1
    4'b0010: segment = 7'h24;// 2
    4'b0011: segment = 7'h30;// 3
    4'b0100: segment = 7'h19;// 4
    4'b0101: segment = 7'h12;// 5
    4'b0110: segment = 7'h02;// 6
    4'b0111: segment = 7'h78;// 7
    4'b1000: segment = 7'h00;// 8
    4'b1001: segment = 7'h18;// 9
    4'b1010: segment = 7'h08;// A
    4'b1011: segment = 7'h03;// b
    4'b1100: segment = 7'h46;// C
    4'b1101: segment = 7'h21;// d
    4'b1110: segment = 7'h06;// E
    4'b1111: segment = 7'h0E;// F

     default: segment = 7'hFF;


    endcase
end
endmodule


//Module responsible for separating the units and tens from the overall numeric result, so that tens can be placed in the HEX[1][n] screens, and units can be placed in HEX[0][n] screens.
module split_value(result, ones, tens);

input [4 : 0] result;

output reg [3 : 0] tens;
output reg [3 : 0] ones;
reg holder;

always @(result)
begin
ones = result % 10;
tens = (result - (result % 10)) / 10;
end
   
endmodule



// Taken from the ClockDivider Module Given and modified
// updates every second so that counter can update the current number displayed on the HEX screens in real time.

module Blinker(result, ones, tens);

input [4 : 0] result; // initial countdown

output reg [3 : 0] tens; // tens displayed on HEX1
output reg [3 : 0] ones; // ones displayed on HEX0

always @(result) begin
ones = result % 10; // modulus function used to collect only the unit result (remainer of result/10)
tens = (result - (result % 10)) / 10; // modulus function and division used to get rid of units result (floor the decimals) and get tens result.
end
   
	
	
endmodule


