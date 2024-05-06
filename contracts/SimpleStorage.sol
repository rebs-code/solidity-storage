// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7; //import version of solidity, 0.8.7 is considered a stable version. ^ in front means 'above'

contract SimpleStorage {
    //This gets initialized to zero
    //it automatically gets a view getter
    uint256 public favoriteNumber;

    mapping(string => uint256) public nameToFavoriteNumber;

      struct People {
        uint256 favoriteNumber; //index 0
        string name; //index 1
    }

    //create a new instance of the struct People called person
    //favoriteNumber is indexed to 0, name to 1
    //this also gets a getter named person that retrieves the object inside it
    People public person = People({favoriteNumber: 2, name: 'Pat'});

    //creating an array is a better way of creating a list
    // given a getter as it's a public variable, the getter will ask for a uint256 as it's the index of the people in the array
    // this is a dynamic array, bc the size of the array isn't given at initialization 
    //to give a size, I could do People[3] to assign max size of 3
    People[] public people;

    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }

    //view, meaning it doesn't require gas to run bc we are just reading a value in this case.
    //view functions disallow midifcation of state -> you can't update the blockchain with it. 
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

    //function to add people to the array
    function addPerson(uint256 _favoriteNumber, string memory _name) public {
        people.push(People(_favoriteNumber, _name));
        //add to the mapping
        nameToFavoriteNumber[_name] = _favoriteNumber;

    }
}
