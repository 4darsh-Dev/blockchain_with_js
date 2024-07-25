// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// libraries => better way of organizing maths/computations with internal func no state vars possible

library PriceConverter {
    function getPrice() internal  view returns (uint256) {
        // ABI 
        // Address of the contract : 0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);

        (,int256 price,,,) = priceFeed.latestRoundData();

        // ETH in terms of USD
        // type converstion with decimal fixing 
        return  uint256(price * 1e10);


    }

    function getVersion() internal view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    function getConversionRate( uint256 ethAmount) internal  view  returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountUsd = (ethPrice * ethAmount) / 1e18;
        return  ethAmountUsd;

    }

}
