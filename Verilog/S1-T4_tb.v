module test_snakes_and_ladders;
    reg clk;
    reg reset;
    wire [6:0] player_pos;
    wire win;

    // Instantiate the game
    snl3(.clk(clk), .reset(reset), .player_pos(player_pos), .win(win));

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        #10 reset = 0;

        // Run the simulation for more time
        #1000 $finish;  // Run for 1000 time units
    end

    // Monitor the game output
    initial begin
        $monitor("Time: %0d, Player Position: %d, Win: %b", $time, player_pos, win);
    end

    // Add extra display after dice rolls or movements
    always @(posedge clk) begin
        $display("At time %0d: Player Position = %d, Win = %b", $time, player_pos, win);
    end
endmodule