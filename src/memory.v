/*
    Module for Memory
*/

module data_memory(rw,location,out,data,clk);
input rw;
input clk;
input [31:0] data;
input [31:0] location;
output [31:0] out;
reg [31:0] output_buffer;
reg [31:0] memory [1023:0];
always @(posedge clk) begin
    if (rw==1'b0) begin

        output_buffer = memory[location];
    end    
    else if (rw==1'b0) begin
        memory[location] = data;
    end
end
assign out = output_buffer;
endmodule

module instruction_memory(read_address,out,clk);
input [31:0] read_address;
input clk;
reg [31:0] output_buffer;
reg [31:0] memory [1023:0];
output [31:0] out;

initial begin
    memory[0] <= 32'b00000000001100010000000010110011;
    memory[1] <= 32'b00000000010000100111000110110011;
    memory[2] <= 32'b00000000001100010000000010110011;
    //smemory[3] = 32'b10000000001100010000000010110011;
end

always @(posedge clk) begin
    output_buffer <= memory[read_address];
    $display("instruction_fetched = %b",output_buffer);
end
assign out = output_buffer;
endmodule

