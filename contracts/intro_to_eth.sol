
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import myFuncs from "contracts/lib_intro.sol";

contract Transaction{

    using  myFuncs;

    uint256 public  number;
    constructor(uint256 _number){
        number = _number;
       
    }
    // pure functions -> do not use vars internal
    function greetUser() public  pure  returns(string memory){
        return "hello world\n";
    }

    // function display() public returns (uint256){
    //     return number;
    // }

    // bitwise operators 

}

contract bitWiseOp{
    uint a =10;
    uint b = 2;

    // Bitwise, 
    function bitwiseAnd() public  view  returns(uint){
        return  a & b;
    }

    function bitwiseOr() public  view returns (uint){
        return  a | b;
    }

    function bitwiseNot() public  view  returns (uint, uint){
        return  (~a, ~b);
    }

    function shiftOp() public  view returns (uint, uint){
        return (a<<b, a>>b);

    }
}