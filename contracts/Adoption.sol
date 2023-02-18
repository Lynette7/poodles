// SPDX-License-Identifier: MIT

//The minimum version of Solidity required is noted at the top of the contract: pragma solidity ^0.5.0;.
//The pragma command means "additional information that only the compiler cares about", while the caret symbol
//(^) means "the version indicated or higher".
pragma solidity ^0.5.16;

contract Adoption{
    //define a single variable (adopters) which is an array of Ethereum addresses of length 16.
    address[16] public adopters;

    //Adopting a pet
    //Allow users to make adoption requests
    function adopt(uint petId) public returns (uint) {
        //check to make sure petId is in range of our adopters array using require() statement
        require (petId >= 0 && petId <= 15);

        //Add the address of the person or smart contract that made the call to our adopters
        //array and who called this function, denoted by msg.sender
        adopters[petId] = msg.sender;

        return petId;
    }

    //Retrieving the adopters
    //The view keyword means that the function will not modify the state of the contract.
    function getAdopters() public view returns (address[16] memory) {
        //Since adopters is already declared, simply return it. The return type (in this case, the type for adopters)
        //is address[16] memory. memory gives the data location for the variable.
        return adopters;
    }
}