module dice(
    output reg [2:0] dice_value, 
    input clk, 
    input reset
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            dice_value <= 3'b001; // Reset to 1
        else
            dice_value <= (dice_value % 6) + 1; // Cycle through 1 to 6
    end
endmodule

module position_tracker(
    input [2:0] dice_value, 
    input [6:0] current_pos, 
    output reg [6:0] new_pos
);
    always @(*) begin
        if (current_pos + dice_value <= 100)
            new_pos = current_pos + dice_value;
        else
            new_pos = current_pos; // No movement if dice roll exceeds 100
    end
endmodule

module snakes_ladders(
    input [6:0] pos, 
    output reg [6:0] adjusted_pos
);
    always @(*) begin
        case(pos)
            17: adjusted_pos = 7;    // Snake: 17 -> 7
         
            62: adjusted_pos = 19;   // Snake: 62 -> 19
            87: adjusted_pos = 36;   // Snake: 87 -> 36
            
            9:  adjusted_pos = 31;   // Ladder: 9 -> 31
            28: adjusted_pos = 84;   // Ladder: 28 -> 84
            
            63: adjusted_pos = 81;   // Ladder: 63 -> 81
            default: adjusted_pos = pos; // No snake or ladder
        endcase
    end
endmodule

module game_end(
    input [6:0] pos, 
    output reg win
);
    always @(*) begin
        if (pos == 100)
            win = 1;  // Player wins
        else
            win = 0;
    end
endmodule

module snl3(
    input clk, 
    input reset, 
    output reg [6:0] player_pos, 
    output reg win
);
    wire [2:0] dice_value;
    wire [6:0] new_pos, adjusted_pos;
    wire win_signal;

    // Instantiate submodules
    dice dice_roll(.dice_value(dice_value), .clk(clk), .reset(reset));
    position_tracker pos_tracker(.dice_value(dice_value), .current_pos(player_pos), .new_pos(new_pos));
    snakes_ladders adjust_pos(.pos(new_pos), .adjusted_pos(adjusted_pos));
    game_end end_check(.pos(adjusted_pos), .win(win_signal));

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            player_pos <= 0;
            win <= 0;
        end else begin
            player_pos <= adjusted_pos;
            win <= win_signal; // Ensure this is assigned correctly
        end
    end
endmodule

