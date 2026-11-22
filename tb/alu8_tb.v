
`timescale 1ns/1ps

module alu8_tb;

    reg clk = 0;
    reg rst = 0;
    reg [7:0] a, b;
    reg [2:0] op;

    wire [7:0] y;

    // Test edilen devre (DUT)
    alu8 dut (
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(b),
        .op(op),
        .y(y)
    );

    // 10 ns periyotlu saat
    always #5 clk = ~clk;

    initial begin
        $dumpfile("alu8.vcd");
        $dumpvars(0, alu8_tb);

        rst = 1;
        a = 0;
        b = 0;
        op = 0;

        #2 rst = 0;

        // Toplama: 10 + 5 = 15
        a = 10;
        b = 5;
        op = 3'b000;

        #10;

        // Çıkarma: 10 - 5 = 5
        op = 3'b001;

        #10;

        // AND
        op = 3'b010;

        #10;

        // OR
        op = 3'b011;

        #10;

        // XOR
        op = 3'b100;

        #10;

        $finish;
    end

endmodule
