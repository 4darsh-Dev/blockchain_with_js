// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FallBackEx {
    uint256 public result;

    // gets triggered any time we send some transaction (no calldata)
    receive() external payable {
        result = 1;
     }

    fallback() external payable {
        result = 2;
        
     }
}