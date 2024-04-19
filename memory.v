/*
    Module for Memory
*/

module memory(rw,location,out,data);
input rw;
input [31:0] data;
input [1023:0] location;
output [31:0] out;
reg [31:0] output_buffer;
reg [31:0] memory [1023:0];
always @(rw) begin
    if (rw==1'b0) begin
        output_buffer = memory[location];
    end    
    else if (rw==1'b0) begin
        memory[location] = data;
    end
end
assign out = output_buffer
endmodule

