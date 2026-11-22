
module alu8 (
    input wire clk,
    input wire rst,
    input wire [7:0] a,
    input wire [7:0] b,
    input wire [2:0] op,
    output reg [7:0] y
);

reg [7:0] result;

always @(*) begin
    case (op)
        3'b000: result = a + b;
        3'b001: result = a - b;
        3'b010: result = a & b;
        3'b011: result = a | b;
        3'b100: result = a ^ b;
        default: result = 8'b0;
    endcase
end

always @(posedge clk or posedge rst) begin
    if (rst)
        y <= 8'b0;
    else
        y <= result;
end

endmodule
