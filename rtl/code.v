`timescale 1ns / 1ps

module bin_to_leds(
    input [3:0] b_in,
    output reg [6:0] leds  
    );
    
    always @(b_in)
        case(b_in)
            0: leds = 7'b1111110;
            1: leds = 7'b0110000;
            2: leds = 7'b1101101;
            3: leds = 7'b1111001;
            4: leds = 7'b0110011;
            5: leds = 7'b1011011;
            6: leds = 7'b1011111;
            7: leds = 7'b1110000;
            8: leds = 7'b1111111;
            9: leds = 7'b1111011;
            default: leds = 7'b0000000;
        endcase
endmodule

`timescale 1ns / 1ps

module invert7(
    input [6:0] a,
    output [6:0] x  
    );

assign x = ~a;
    
endmodule

timescale 1ns / 1ps

module seven_seg_out(
    input [3:0] b_in,
    output [6:0] inv_leds,
    output [7:0] enb_leds 
    );
    
    wire [6:0] leds;

    assign enb_leds = 8'b11111110;

    bin_to_leds u1 (.b_in(b_in), .leds(leds));
    invert7 u2 (.a(leds), .x(inv_leds));
endmodule
