// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

//now ExtraStorage will inherit all the functionalities of SimpleStorage. ExtraStorage is a child of SimpleStorage
contract ExtraStorage is SimpleStorage {
    //we want the store function to add +5
    //we are doing an operation called overriding
    // keywords: virtual, override

    function store(uint256 _favoriteNumber) public override  {
        favoriteNumber = _favoriteNumber + 5;
    }
}