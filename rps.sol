// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/** 
 * @title Rps
 * @dev Implements rock paper scissors game
 * @TODO: Enums instead of uint; Adjust visibility
 */
contract Rps {

    event Registered(address _from, string message);
    event StageChange(uint oldStage, uint newStage, string message);
    event PlayPlayed(address _from, uint _play, string message);
    event Winner(address winner, string message);

    uint stage = 0; // 0 = register, 1 = playing, 2 = result
    // uint playerNumber = 0;

    struct Player {
            uint play; // 1 = rock, 2 = scissors, 3 = paper, 0 = not played yet
            bool registered;
            address playerAddress;
    }

    // mapping(address => Player) public players;

    Player[2] public players;
    address public result;

    function register() public {
        require(stage == 0, "Wrong stage!"); // Check stage
        require(players[1].registed == false, "Maximum player count reached!"); // Make sure there is space in the player array

        // players[msg.sender] = Player(0, true);
        players.push(Player(0, true, msg.sender))

        emit Registered(msg.sender, "Player registered!");

        // playerNumber += 1;
        if (players[1].registed == true) {
            stage = 1;
            emit StateChange(0, 1, "Stage changed!");
        }
    }

    function play(uint _play) public {
        // require(players[msg.sender].registered == true, "Player not registered!"); // Check that player is registered
        require(players[0].playerAddress == msg.sender  players[1].playerAddress == msg.sender, "Player not registered") // Check that the player is registered
        require(_play > 0  _play < 4, "Invalid play!"); // Check that play is valid
        // require(players[msg.sender].play == 0, "Player already played!"); // Make sure player didn't play yet
        

        // players[msg.sender].play = _play;
        if (players[0].playerAddress == msg.sender) {
            require(players[0].play == 0, "Player already played!");
            players[0].play = _play
        } else {
            require(players[1].play == 0, "Player already played!");
            players[1].play = _play
        }
    }
    
// 1 = rock, 2 = scissors, 3 = paper, 0 = not played yet

    function result() public returns(string result) {
        if (players[0].play == players[1].play) {
            return "Draw";
        } else if (player[0].play == 1 && player[1].play == 2) {
            result = player[0].address;
            return "Player 1 wins!"
        } else if (player[0].play == 1 && player[1].play == 3) {
            result = player[1].address;
            return "Player 2 wins!"
        } else if (player[0].play == 2 && player[1].play == 1) {
            result = player[1].address;
            return "Player 2 wins!"
        } else if (player[0].play == 2 && player[1].play == 3) {
            result = player[0].address;
            return "Player 1 wins!"
        } else if (player[0].play == 3 && player[1].play == 1) {
            result = player[0].address;
            return "Player 1 wins!"
        } else if (player[0].play == 3 && player[1].play == 2) {
            result = player[1].address;
            return "Player 2 wins!"
        }
    }
}