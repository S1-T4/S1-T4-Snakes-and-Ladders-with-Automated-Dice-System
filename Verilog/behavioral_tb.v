module testbench;
    reg clk;
    reg reset;
    wire [6:0] pos1, pos2;
    wire [1:0] winner;

    // Instantiate the snakes and ladders game
    snakes_ladders game (.clk(clk), .reset(reset), .pos1(pos1), .pos2(pos2), .winner(winner));

    initial begin
        // Initialize
        clk = 0;
        reset = 1;
        #5 reset = 0; // Release reset

        // Run the simulation for 2000 time units
        #2000;
        if (winner === 2'b10) begin
            $display("Time limit reached. No winner.");
        end else begin
            $display("Player %0d wins!", winner + 1); // Display winner (1 or 2)
        end

        // End simulation
        $stop;
    end

    // Generate clock signal
    always #10 clk = ~clk; // Toggle clock every 10 time units

    // Monitor output
    initial begin
        $monitor("Time: %0d, Player 1 Position: %0d, Player 2 Position: %0d", $time, pos1, pos2);
    end
endmodule
