# Snakes and Ladders Game with Automated Dice System


<!-- First Section -->
## Team Details
<details>
  <summary>Detail</summary>

  > Semester: 3rd Sem B. Tech. CSE

  > Section: S1

  > Team ID: T4

  Member-1: Kashish Prajapat , 231CS129 . kashishprajapat.231cs129@nitk.edu.in 

  Member-2: Vaishnavi Khade , 231CS130 . khadevaishnavi.231cs130@nitk.edu.in

  Member-3: Anurag  Wagh  , 231CS166 . waghanuragarjun.231cs166@nitk.edu.in 
</details>

<!-- Second Section -->
## Abstract
<details>
  <summary>Detail</summary>
  
  >**Motivation:**
Snake and Ladder has been a classical board game, enjoyed by children and adult alike. However, the old version of the game can feel too simple, especially when today we are surrounded by technology and it has become a big part in our lives.by adding technology to the game, we can make it more exciting, fun and educational. So the goal is to combine this classical board game with modern technology which will provide more features to the game, thus making it more interactive to keep players interested while they are playing.


>**Problem Statement:**
It will be a multiplayer game. -The board consists of 100 squares arranged in a 10x10 grid.The positions of snakes and ladders will be predefined,in which when a ladder is encountered player moves higher in the game while when a snake is encountered the player goes down.The players move according to the result of an automated dice.After each dice roll, the system should check whether the new position corresponds to a snake or a ladder. If so, the player’s position should be adjusted accordingly.Finish in the game is detected when a player reaches exactly square 100, indicating the end of the game.


>**Features:**
The digital Snakes and Ladders game system incorporates several interactive and engaging features. Light indicators at the start and end points of snakes and ladders help players track their movements visually. . Additionally, an automated dice system is implemented, removing manual rolls and ensuring a seamless gaming experience. These features create a smooth and dynamic gameplay environment .

</details>

## Functional Block Diagram
<details>
  <summary>Detail</summary>
  
  <img src="https://github.com/user-attachments/assets/87c3e93b-710c-4d24-b5b7-8bbfa6ba6934" alt="Functional Block Diagram" width="300" />
  
</details>


<!-- Third Section -->
## Working
<details>
  <summary>Detail</summary
          
The goal of the game is to navigate a player from the starting position (0) to the winning position (100) based on dice rolls while encountering snakes that bring the player back and ladders that advance the player forward.

The design consists of the following key modules:
•	Dice Roll Module: This module simulates rolling a dice. On each clock cycle, it generates a random value between 1 and 6. The dice value resets to 1 when the game resets.
	•	Position Tracker Module: This module updates the player’s position based on the rolled dice value. If adding the dice value to the current position exceeds 100, the position remains unchanged, preventing overshooting the win condition.
	•	Snakes and Ladders Adjustment Module: This module adjusts the player’s position when they land on specific squares. If a player lands on a snake’s mouth, they move down to its tail; if they land on a ladder’s base, they climb to its top.
	•	Game End Detection Module: This module checks if the player’s position is exactly 100, which indicates a win. If so, it signals that the game is over.
	•	Top-Level Game Module: This central module orchestrates the interaction between the other modules. It updates the player’s position based on the results of the dice roll and checks for a win condition, all triggered by the clock cycles.

Working:
	•	Initialization: The player starts at position 0. Upon reset, the game initializes the player position and prepares for a new game.
	•	Dice Rolling: The dice roll is triggered on each clock cycle, producing a value from 1 to 6.
	•	Position Update: The position tracker updates the player’s position based on the rolled value. It ensures that the position does not exceed 100.
	•	Snakes and Ladders Check: After updating the position, the game checks for any snakes or ladders affecting the player’s new position.
	•	Win Check: After updating the position, the game checks if the player has reached position 100, indicating victory.

Working
1.Truth Table
Each row in the truth table shows the player's current state, the dice roll, the new state if no ladder or snake is present, whether a ladder/snake exists, and the final state after adjusting for snakes or ladders.



2.State Diagrams
• Each state represents the current position of the player on the board.
• Inputs: Dice roll (values from 1 to 6)
• Outputs: Updated player position based on the dice roll, and whether the player lands on a ladder (go up) or a snake (go down).
• Transitions: If the player lands on a ladder, the state jumps to a higher value.
If they land on a snake, the state moves to a lower value.
• Eg. State 5 → Dice Roll 3 → State 8
• State 17 → Snake to State 7 (fall)

  > 
</details>

<!-- Fourth Section -->
## Logisim Circuit Diagram
<details>
  <summary>Detail</summary>
  This circuit design simulates a digital version of the Snakes and Ladders game for two players. It incorporates logic gates, BCD to 7-segment displays, and a dice roll mechanism to manage player movements on the board. The system tracks each player's position, handles snake and ladder encounters, and determines the win condition when a player reaches the 100th position. With reset and dice control buttons, the circuit automates the gameplay, providing a dynamic and interactive experience.
  </br>

  
  <details>
    <summary>Main Circuit</summary>
    
 ![image](https://github.com/user-attachments/assets/a958378d-4443-4ed8-a4d3-5e9eba74fc72)
</details>
<details>
    <summary>Dice</summary>
    ![image](https://github.com/user-attachments/assets/294f9b35-a1ad-4749-8b96-093bd1dabd9d)
</details>
<details>
    <summary>Win Condition</summary>
    ![image](https://github.com/user-attachments/assets/cf13de14-6757-43f9-9875-9a627fa2e1a1)

</details>
<details>
    <summary>BCD to 7 segment</summary>
   ![image](https://github.com/user-attachments/assets/2b60ef0a-c409-47f6-be30-70fdd691e8de)
</details>
<details>
    <summary>Binary to BCD</summary>
  ![image](https://github.com/user-attachments/assets/5b639652-9b63-46a2-953f-78fea08c2493)

</details>

  

</details>

<!-- Fifth Section -->
## Verilog Code
<details>
  <summary>Detail</summary>
. Dice Roll Module
This module simulates a dice roll with values ranging from 1 to 6. On each positive edge of the clock or when a reset occurs, the dice value is updated. If reset is active, the dice value resets to 1. Otherwise, it increments cyclically to simulate a dice roll, wrapping back to 1 after reaching 6.

 
2. Position Tracker Module
This module updates the player’s position based on the dice roll. It checks if the sum of the current position and the dice value exceeds 100. If the sum is valid, the new position is updated. If not, the player stays at the same position to ensure the position does not exceed 100.


3. Snakes and Ladders Adjustment Module
This module adjusts the player’s position if it lands on a snake or ladder. Using a case statement, it maps specific positions to new ones. For example, landing on 17 moves the player back to 7 (snake), while landing on 28 moves them to 84 (ladder). If the position does not correspond to a snake or ladder, the position remains unchanged.


4. Game End Detection Module
This module checks if the player has won the game. If the player’s position equals 100, the win signal is set to 1, indicating victory. Otherwise, the signal remains 0.

5. Top-Level Game Module
This module integrates the dice, position tracker, snakes and ladders adjustment, and game end detection modules. It updates the player’s position and win status on each clock cycle. If reset is activated, the player’s position resets to 0. Otherwise, the position is updated based on the dice roll and adjusted for any snakes or ladders.


6.. Testbench Module
The testbench simulates the complete game system. It initializes the clock and reset signals, toggling the clock every 5 time units. After 10 units, the reset is deactivated to start the game. The simulation runs , during which the player’s position and win status are continuously monitored. The testbench helps ensure the game logic works as expected by displaying the position and win status at each time step.

This design efficiently models  snakes and ladders game in Verilog, using modular components for easy testing and simulation.
  >
</details>

## References
<details>
  <summary>Detail</summary>
  
1. Raghuram42,Snake and Ladders LLD. GitHub: https://github.com/Raghuram42/snakeandladdersLLD
2. rajpatel5,Snakes and Ladder. GitHub: https://github.com/rajpatel5/SnakesAndLadder
3. YouTube Video: https://www.youtube.com/watch?v=NLzZQ3ROa7Q
4. Digital Design, M. Morris Mano, 5th Edition.
2. Verilog HDL, Samir Palnitkar, 2nd Edition.
3. Logisim User Guide: http://www.cburch.com/logisim/
   
</details>


