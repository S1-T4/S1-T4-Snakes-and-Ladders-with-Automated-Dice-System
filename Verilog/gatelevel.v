
module dice (
    input clk,                // Clock input
    input reset,              // Reset input
    input roll,               // Trigger to roll the dice
    output reg [2:0] dice_value // 3-bit dice value (from 1 to 6)
);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            dice_value <= 3'b001;  // Reset dice value to 1
        end else if (roll) begin
            dice_value <= ($random % 6) + 1;  // Random value between 1 and 6
        end
    end
endmodule

// Module 2: Player Position Tracker using Adders
module player_position_tracker (
    input clk,                 // Clock input
    input reset,               // Reset input
    input [6:0] current_position, // Current position of the player
    input [2:0] dice_value,    // Dice value from the Dice module
    output reg [6:0] new_position   // New position of the player
);
    wire [6:0] incremented_position; // Intermediate position after increment

    // 7-bit Adder
    assign incremented_position = current_position + {4'b0000, dice_value}; // Extend dice value to 7 bits

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            new_position <= 7'd0;  // Reset position
        end else begin
            // Limit the position to 100 (7'd100)
            new_position <= (incremented_position <= 7'd100) ? incremented_position : current_position;
        end
    end
endmodule

// Module 3: Snakes and Ladders using Comparators and Multiplexers
module snakes_and_ladders (
    input [6:0] position,        // Current position of the player
    output reg [6:0] updated_position // Updated position after snakes/ladders
);
    always @(*) begin
        case (position)
            7'd17: updated_position = 7'd7;   
            7'd87: updated_position = 7'd36;  
            7'd62: updated_position = 7'd19;  
            7'd9:  updated_position = 7'd31;  
            7'd28:  updated_position = 7'd84;   
            7'd63: updated_position = 7'd81;  
            default: updated_position = position; // No change
        endcase
    end
endmodule

// Module 4: Win Condition using Comparators
module win_condition (
    input [6:0] position,   // Current position of the player
    output win              // Win flag (1 if position is 100)
);
    assign win = (position == 7'd100);
endmodule

// Module 5: Integrate all modules for two players
module snakes_and_ladders_game (
    input clk,                 // Clock input
    input reset,               // Reset input
    input roll,                // Trigger to roll the dice
    input player_switch,       // Switch player (1 for Player 1, 0 for Player 2)
    output reg [6:0] position1,    // Current position of Player 1
    output reg [6:0] position2,    // Current position of Player 2
    output win1,               // Win flag for Player 1
    output win2                // Win flag for Player 2
);
    wire [2:0] dice_value;           // Dice output
    wire [6:0] new_position1;        // New position after dice roll for Player 1
    wire [6:0] new_position2;        // New position after dice roll for Player 2
    wire [6:0] updated_position1;    // Position after snakes/ladders for Player 1
    wire [6:0] updated_position2;    // Position after snakes/ladders for Player 2
    wire win_flag1;                  // Win flag for Player 1
    wire win_flag2;                  // Win flag for Player 2

    // Instantiate Dice Module
    dice d1 (
        .clk(clk),
        .reset(reset),
        .roll(roll),
        .dice_value(dice_value)
    );

    // Instantiate Player Position Tracker for Player 1
    player_position_tracker ppt1 (
        .clk(clk),
        .reset(reset),
        .current_position(position1),
        .dice_value(dice_value),
        .new_position(new_position1)
    );

    // Instantiate Player Position Tracker for Player 2
    player_position_tracker ppt2 (
        .clk(clk),
        .reset(reset),
        .current_position(position2),
        .dice_value(dice_value),
        .new_position(new_position2)
    );

    // Instantiate Snakes and Ladders Module for Player 1
    snakes_and_ladders sl1 (
        .position(new_position1),
        .updated_position(updated_position1)
    );

    // Instantiate Snakes and Ladders Module for Player 2
    snakes_and_ladders sl2 (
        .position(new_position2),
        .updated_position(updated_position2)
    );

    // Instantiate Win Condition Module for Player 1
    win_condition wc1 (
        .position(updated_position1),
        .win(win_flag1)
    );

    // Instantiate Win Condition Module for Player 2
    win_condition wc2 (
        .position(updated_position2),
        .win(win_flag2)
    );

    // Update positions based on player switch
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            position1 <= 7'd0;  // Reset Player 1 position
            position2 <= 7'd0;  // Reset Player 2 position
        end else begin
            if (player_switch) begin
                position1 <= updated_position1; // Update Player 1's position
            end else begin
                position2 <= updated_position2; // Update Player 2's position
            end
        end
    end

    // Win flags
    assign win1 = win_flag1;
    assign win2 = win_flag2;

endmodule

