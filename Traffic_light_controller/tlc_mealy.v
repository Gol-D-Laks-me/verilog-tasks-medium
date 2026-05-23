// an extra feature "pedestrian" is added\
module tlc(
    input clk,
    input reset,
    input pedestrian;
    output reg red,
    output reg yellow,
    output reg green
);

reg [1:0] state, n_state;

parameter RED    = 2'b00,
          GREEN  = 2'b01,
          YELLOW = 2'b10;

//
// STATE REGISTER
//
always @(posedge clk or posedge reset) begin
    if (reset)
        state <= RED;
    else
        state <= n_state;
end

//
// NEXT STATE LOGIC
//
always @(*) begin
    case(state)
        RED:    n_state = GREEN;
        GREEN:begin
          if(pedestrian) n_state = YELLOW;
          else n_state = GREEN;
        end  
        YELLOW: n_state = RED;
        default:n_state = RED;
    endcase
end

//
// OUTPUT LOGIC
//
always @(*) begin
    red = 0;
    yellow = 0;
    green = 0;

    case(state)
        RED:    red = 1;
        GREEN:  green = 1;
        YELLOW: yellow = 1;
    endcase
end

endmodule