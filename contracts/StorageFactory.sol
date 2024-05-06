// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory {
    //create a variable of type SimpleStorage
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        //This line creates a new instance of the SimpleStorage contract and assigns it to the variable simpleStorage.
        //Declaring a variable named simpleStorage of type SimpleStorage, using the new keyword to create a new instance of the SimpleStorage contract. 
        //This new instance will be assigned to the simpleStorage variable.
        SimpleStorage simpleStorage = new SimpleStorage();
        //push the new instance to the simpleStorageArray
        simpleStorageArray.push(simpleStorage);
    }

    //create function to call the store function inside SimpleStorage.sol
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // Address
        // ABI - Application Binary Interface
        return simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
       
    }

    //create a function that can read that value
    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        return simpleStorageArray[_simpleStorageIndex].retrieve();
        
    }
}