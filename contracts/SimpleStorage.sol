
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; // specifying version

contract SimpleStorage{
    // types : boolena, unit, int, address(metamask), bytes

    bool hasfavorite = true;
    // 256 bits (8-256) (max 256)
    uint256 favorteNum = 123;

    string name = "harry";

    int256 favoriteInt = -500;

    address myAddress = 0xC60d2167B348708875a1f276484167EbC62e7b52;
    // strings can be conerted into bytes objects (max 32) 
    bytes32 favoriteBytes = "harry";

    uint256  favNum; // auto intiazlied to 0 (node value)
    
    // auto matically make variable to internal(only accessed by child class and class)

    // Functions in solidity

    // More stuff you add more expensive transaction cost

    function myStore(uint256 _favoriteNum) public {
        favorteNum = _favoriteNum;
        favorteNum += 1;
        retrieve();
    }

    // Variables here are block scoped by defualt

    function retrieve() public  view returns   (uint256) {
        return  favorteNum;
    }

    // pure function, doest read data from blockchain
    function add() public  pure returns (uint256) {
        return(1+50);
    }

    // Gas is only spend when we perform transaction (change in blockchain state)

    // struct objects
    struct People{
        uint256 favorteNum;
        string name;
        bool smart;

    }

    People public person1 = People({favorteNum : 52, name : "Adarsh", smart: true});

    // creating an array

    // dynamic array
    People[] public  peopleArr;

    //fixed array
    uint256[4] public numArr;

    function addPerson(string memory _name, uint256 _favNum, bool _smart) public{
        // populating the struct array 
        peopleArr.push(People(_favNum, _name, _smart));

        // other way ;
        People memory newPerson = People({favorteNum: _favNum, name: _name, smart: _smart});
        
        peopleArr.push(newPerson);


    }

    

}