
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "contracts/simpleStorage.sol";

// inheritance

contract ExtraStore is SimpleStorage {

    // function override using virtual and override keyword

    function store(uint256 _favoriteNumber) public override  {
       favoriteNumber  = _favoriteNumber + 5;


    }

}