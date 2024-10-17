
// Testbench for Snakes and Ladders Game
module testbench;
    reg clk;
    reg reset;
    reg roll;
    reg player_switch; // Switch between players
    wire [6:0] position1;
    wire [6:0] position2;
    wire win1;
    wire win2;

    // Instantiate the Snakes and Ladders Game
    snakes_and_ladders_game game (
        .clk(clk),
        .reset(reset),
        .roll(roll),
        .player_switch(player_switch),
        .position1(position1),
        .position2(position2),
        .win1(win1),
        .win2(win2)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns clock period
    end

    // Test procedure
    initial begin
        // Initialize signals
        reset = 1;
        roll = 0;
        player_switch = 1; // Start with Player 1

        // Release reset after some time
        #10 reset = 0;

        // Simulate rolling the dice for both players
        repeat (20) begin
            #10 roll = 1;  // Roll the dice
            #10 roll = 0;

            // Switch players
            player_switch = ~player_switch;

            // Display current positions and win status
            $display("Player 1 Position: %d, Win: %b", position1, win1);
            $display("Player 2 Position: %d, Win: %b", position2, win2);

            // Check for winning conditions
            if (win1) begin
                $display("Player 1 wins!");
                $stop; // Stop simulation
            end
            if (win2) begin
                $display("Player 2 wins!");
                $stop; // Stop simulation
            end
        end
        $stop; // Stop simulation
    end
endmodule