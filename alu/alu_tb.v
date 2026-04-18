module alu_tb();

    reg [7:0] a,b;
    reg [2:0] op;
    wire [7:0] result;
    wire carry;

    alu ins(.a(a), .b(b), .result(result), .op(op), .carry(carry));

    initial begin
        op = 3'b000; a = 8'd10; b = 8'd100; #10;
        op = 3'b001; a = 8'd10; b = 8'd90; #10;
        op = 3'b001; a = 8'd110; b = 8'd100; #10;
        op = 3'b010; a = 8'd98; b = 8'd198; #10;
        op = 3'b011; a = 8'd110; b = 8'd30; #10;
        op = 3'b100; a = 8'd120; b = 8'd123; #10;
        $finish;
    end

    initial begin
$monitor("t=%0t a=%b b=%b op=%b result=%b carry=%b", $time, a, b, op, result, carry);   
           end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, alu_tb);
    end

endmodule