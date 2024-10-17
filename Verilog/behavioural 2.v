module dice (
    output reg [2:0] roll,
    input wire clk,
    input wire reset
);
    always @(posedge clk or posedge reset) begin
        if (reset) 
            roll <= 3'b000; // Reset the dice
        else 
            roll <= $urandom_range(1, 6); // Random number between 1 and 6
    end
endmodule

module player (
    input wire clk,
    input wire reset,
    input wire [2:0] roll,
    input wire turn, // Player turn indicator
    output reg [6:0] position // 0-99 for board size
);
    reg [6:0] next_position;

    always @(posedge clk or posedge reset) begin
        if (reset) 
            position <= 7'd0; // Start at position 0
        else if (turn) begin // Only move if it's this player's turn
            next_position = position + roll;
            if (next_position > 99)
                position <= position; // Stay at the same position if over 99
            else begin
                // Check for snakes and ladders
                case (next_position)
                    7'd3: position <= 7'd22; // Ladder
                    7'd5: position <= 7'd8;  // Ladder
                    7'd11: position <= 7'd26; // Ladder
                    7'd20: position <= 7'd29; // Snake
                    7'd17: position <= 7'd4;  // Snake
                    // Add more snakes and ladders here
                    default: position <= next_position; // Normal move
                endcase
            end
        end
    end
endmodule

module snakes_ladders (
    input wire clk,
    input wire reset,
    output wire [6:0] pos1,
    output wire [6:0] pos2,
    output reg [1:0] winner // 0 for player 1, 1 for player 2, 2 for no winner
);
    wire [2:0] roll1, roll2;
    reg player_turn; // 0 for player 1, 1 for player 2

    // Instantiate dice for both players
    dice dice1 (.roll(roll1), .clk(clk), .reset(reset));
    dice dice2 (.roll(roll2), .clk(clk), .reset(reset));

    // Instantiate players
    player player1 (.clk(clk), .reset(reset), .roll(roll1), .turn(~player_turn), .position(pos1));
    player player2 (.clk(clk), .reset(reset), .roll(roll2), .turn(player_turn), .position(pos2));

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            player_turn <= 0; // Start with player 1
            winner <= 2'b10; // No winner
        end else begin
            if (pos1 >= 100) begin
                winner <= 0; // Player 1 wins
            end else if (pos2 >= 100) begin
                winner <= 1; // Player 2 wins
            end else begin
                player_turn <= ~player_turn; // Switch turns
            end
        end
    end
endmodule

