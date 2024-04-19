module ALU(control,input1,input2,out);
input [6:0] control;
input [31:0] input1;
input [31:0] input2;
output [31:0] out;

wire [31:0] mux_input1,mux_input2,mux_input3,mux_input4,mux_input5,mux_input6,mux_input7,mux_input8,mux_input9,mux_input10,mux_input11,mux_input12,mux_input13,mux_input14,mux_input15,mux_input16;
wire [3:0] select_l;
assign select_l=4'b0001;
nbitadder adder(input1,input2,mux_input1);
nbitsubtractor subtrator(input1,input2,mux_input2);
nbitxor xorgate(input1,input2,mux_input3);
nbitor orgate(input1,input2,mux_input4);
nbitand andgate(input1,input2,mux_input5);

MUX16_1_32 mux(mux_input1,mux_input2,mux_input3,mux_input4,mux_input5,mux_input6,mux_input7,mux_input8,mux_input9,mux_input10,mux_input11,mux_input12,mux_input13,mux_input14,mux_input15,mux_input16,out,select_l);

endmodule

module ALU_tb();
    reg [31:0]a,b;
    reg [6:0] sel;
    wire [31:0]c;
    ALU alu(sel,a,b,c);
    
    initial 
        begin
            $monitor("a=%b,b=%b,sel=%b,c=%b",a,b,sel,c);
            a=32'b0100;b=32'b0100;sel=7'b01;
        #100    a=32'b0100;b=32'b0100;sel=7'b00;
        #100    a=32'b1000;b=32'b0100;sel=7'b10;
        #100    a=32'b1000;b=32'b0100;sel=7'b11;

        end
endmodule