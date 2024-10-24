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
  <summary>Detail</summary>

  ![image](https://github.com/user-attachments/assets/1a614048-45a1-4854-a4b8-69f9cd3538bf)

			 
Players and Dice:
Two players (Player 1 and Player 2) roll virtual dice. The output of the dice determines their movement on the board.
The dice roll is simulated by a circuit generating random numbers within the range of 1-6.

Position Updation:
Each player's current position is tracked and updated based on the dice roll.
The position is updated using combinational logic, and binary-coded decimal (BCD) to 7-segment converters are used to display the players' positions on the board.

Snakes and Ladders:
The circuit detects if a player lands on a snake or ladder using conditional logic gates.
If a snake is encountered, the player's position is decremented (moving them down). Conversely, if a ladder is encountered, the player's position is incremented (moving them up).

Win Condition:
The circuit includes logic to detect if a player reaches or exceeds position 100, which is the winning condition.
A win signal is activated when the condition is met, stopping further dice rolls for that player.

Reset and Dice Operations:
A reset button allows the game to restart, resetting all positions and win conditions.
The dice buttons control when a new random number is generated to simulate a dice roll.

							STATE TABLE 
![image](https://github.com/user-attachments/assets/d240fe38-6cf0-4d35-9496-93672522e678)

The table shows how the game works.



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
    
 <img src="https://github.com/user-attachments/assets/4aa907a3-56ea-49a6-a78e-85fbf5abd4e9" width="650"/>

</details>
<details>
    <summary>Dice</summary>
    <img src="https://github.com/user-attachments/assets/294f9b35-a1ad-4749-8b96-093bd1dabd9d" width="800"/>
</details>
	<details>
    <summary>Snakes and Ladders</summary>
  <img src="https://github.com/user-attachments/assets/05a6d3ba-b483-459a-a269-ec56ef553cb0" width="800"/>

</details>
 <details>   
    <summary>Win Condition</summary>
     <img src="https://github.com/user-attachments/assets/cf13de14-6757-43f9-9875-9a627fa2e1a1" width="800"/>

</details>
<details>
    <summary>BCD to 7 segment</summary>
   <img src="https://github.com/user-attachments/assets/2b60ef0a-c409-47f6-be30-70fdd691e8de" width="800"/>
</details>
<details>
    <summary>Binary to BCD</summary>
  <img src="https://github.com/user-attachments/assets/5b639652-9b63-46a2-953f-78fea08c2493" width="800"/>

</details>

</details>

<!-- Fifth Section -->
## Verilog Code
<details>
	<summary>Details</summary>
  The provided Verilog code implements a SnakesAndLadders module that simulates a two-player snakes and ladders game. The system includes inputs such as clock, reset, dice roll, and player turn, as well as tracking encounters with snakes and ladders. It calculates the players' positions based on dice rolls and adjusts for snakes (moving them down) or ladders (moving them up). The module ensures that the player’s position is displayed on a 7-segment display, and once a player reaches or exceeds a position of 100, they are declared the winner. The system also incorporates logic for controlling LED indicators: one signals the player who wins, while others indicate snake or ladder encounters. Accompanying this module is a testbench that initializes the inputs, generates a clock signal, and systematically tests the SnakesAndLadders module by varying input conditions, monitoring outputs, and providing formatted results for each game cycle. 

 [Verilog File(Gate Level)](Verilog/gatelevel.v)<br>
 [Verilog File(Behavioral Level)](Verilog/behavioral.v)<br>
 [Verilog File(Testbench Gate Level)](Verilog/gatelevel_tb.v)<br>
 [Verilog File(Testbench Behavioral Level)](Verilog/behavioral_tb.v)<br>

 <img src="https://github.com/user-attachments/assets/12c3a673-99c6-4619-b695-8f710074e896" width="300"/>

 
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


