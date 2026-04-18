module uni_tb();

reg [3:0] d_in;
reg s_in, reset;
reg [1:0] op;
reg clk;
wire [3:0] q;

uni ins(
    .d_in(d_in),
    .s_in(s_in),
    .reset(reset),
    .op(op),
    .clk(clk),
    .q(q)
);

// clock
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// stimulus
initial begin
    reset = 1; s_in = 0; d_in = 0; op = 0; #10;
    reset = 0;

    // parallel load
    d_in = 4'b1001; op = 2'b11; #10;

    // shift left
    s_in = 1;
    op = 2'b01; #10;
    op = 2'b01; #10;

    // hold
    op = 2'b00; #10;

    // shift right
    s_in = 1;
    op = 2'b10; #10;
    s_in = 0;
    op = 2'b10; #10;

    $finish;
end

// monitor
initial begin
    $monitor("t=%0t q=%b op=%b s_in=%b", $time, q, op, s_in);
end

// waveform
initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, uni_tb);
end

endmodule