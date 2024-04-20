module registerfile(data,rs1,rs2,rw,out1,out2,clk);
reg [31:0] reg_file [31:0];
input clk;
input [4:0]rd;
input [31:0] data;
input rw;
output [31:0]out;
reg outbuffer;

always @(*) begin
    if (rw==1'b1) begin
        reg_file[rs1] = data;
    end
    else if (rw==1'b0)begin
        outbuffer <= reg_file[rs1];
        outbuffer <= reg_file[rs2];
    end
end
assign out = outbuffer;
endmodule