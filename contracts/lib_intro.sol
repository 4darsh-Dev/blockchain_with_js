// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

library myFuncs{
    function factorial(uint256 num) public  view returns (uint256){
        if(num ==0 || num == 1){
            return 1;
        }
        else{
            return num * factorial(num-1 );
        }
    }
    
}