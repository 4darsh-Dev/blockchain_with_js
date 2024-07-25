
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

// l1: Contracts can hold funds just like wallets

import "PriceConverter.sol";

// Gas Optimizations (for vars used only once)
// old : 951796 gas
// constant keyword : new : 92... gas

// immutable kwrd : new : 90... gas

// Gas optim using custom erros
// new : 87.. gas
error NotOwner();


contract FundMe{

    // library use
    using PriceConverter for uint256;

    uint256 public constant MIN_USD = 50 * 1e18;


    // keep track of funders;
    address[] public  funders;

    // mappings
    mapping (address => uint256) public  addressToAmountFunded;

    // owner address
     address public immutable i_owner;

    // setting the owner of contract
    constructor(){
        i_owner = msg.sender;

    }
    
    function fund() public  payable {

        // Set min send usd amnt
        require(msg.value.getConversionRate() >= MIN_USD, "Value must be at least 1ETH"); // 1e18 = 1*10 ^18 = 1ETH
        // Gases are sent back with revert if require condition doesn't met

        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;


    }

    function withdraw() public onlyOwner {

        // checking for owner (one way)
        // require(msg.sender == owner, "Sender is not Owner! ");

        // for loop solidity
        for (uint256 fundInd = 0; fundInd < funders.length; fundInd++) 
        {
            address funder = funders[fundInd];
            addressToAmountFunded[funder] = 0;

        }

        // reset the aray
        funders = new address[](0);


        // withdraw funds 3:methods

        // Error limist : transfer and send with 2300 gas limit

        // transfer
        // changing sender to payable address
        payable (msg.sender).transfer(address(this).balance);

        //send

        // we need to revert trans manually

        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess, "Sending Failed! Reverting Back \n Thanks");


        // call (most recommended way)
        // lower level func no gas limits

        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call Failed! ");
    }

    modifier  onlyOwner{
        // 1st way
        // require(msg.sender == i_owner, "Sender is not Owner! ");

        // 2nd way
        if(msg.sender != i_owner){revert NotOwner();}
        _; // _ means doing the rest of the code

    }

    // Handling the case when sombody send money to contract without calling fund function 
    // using recieve & fallback special functions.

    receive() external payable {
        fund();
    }

    fallback() external payable { 
        fund();
    }

    
    
}