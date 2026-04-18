module uni(
    input wire clk,
    input wire reset,
    input wire [1:0] op,
    input wire [3:0] d_in,
    input wire s_in,
    output reg [3:0] q
);

always @(posedge clk or posedge reset) begin
    if (reset)
        q <= 4'b0000;
    else begin
        case(op)
            2'b00: q <= q;                       // hold
            2'b01: q <= {q[2:0], s_in};          // shift left
            2'b10: q <= {s_in, q[3:1]};          // shift right
            2'b11: q <= d_in;                   // parallel load
        endcase
    end
end

endmodule