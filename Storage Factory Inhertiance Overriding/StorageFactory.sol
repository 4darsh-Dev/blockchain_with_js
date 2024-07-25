// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

import "./simpleStorage.sol";

contract StorageFactory{
    
    // SimpleStorage public simpleStorage;
    SimpleStorage[] public  simpleStoreArr;

    function createSimpleStorageContract() public  {

        SimpleStorage simpleStore = new SimpleStorage();
        simpleStoreArr.push(simpleStore);
        

    }

    function sfStore(uint256 _simpleStoreInd, uint256 _simpleStoreNum) public {
        // Address
        // ABI application binary interface

        SimpleStorage simpleStore = simpleStoreArr[_simpleStoreInd];
        simpleStore.store(_simpleStoreNum);



    }

    function sfGet(uint256 _simpleStoreInd) public  view returns(uint256){
        SimpleStorage simpleStore = simpleStoreArr[_simpleStoreInd];
        return simpleStore.retrieve();

        // 2nd way
        // return simpleStoreArr[_simpleStoreInd].retrieve();


    }
}