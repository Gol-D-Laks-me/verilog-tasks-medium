module alu(
    input wire [7:0] a, b,
    input wire [2:0] op,
    output reg carry,
    output reg [7:0] result
);

always @(*) begin
    carry = 0;

    case (op)
        3'b000: {carry, result} = a + b;

        3'b001: {carry, result} = a + (~b + 1);

        3'b010: result = a & b;

        3'b011: result = a | b;

        3'b100: result = a ^ b;

        default: begin
            result = 8'b0;
            carry  = 0;
        end
    endcase
end

endmodule