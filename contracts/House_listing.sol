// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
// import 

contract Real_estate {
    // enum HouseAvailalbility { Available, Sold}
    address owner;
    struct House {
        uint id;
        string Name;
        string Location;
        string houseType;
        uint amount;
        address owner;
        bool isAvailable;
    }

    constructor() {
         owner =msg.sender;
    }

    modifier  onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this");
        _;
    }

    mapping(uint256 => House)house;
     uint256 houseCount;

     event houseListedForSale();
     event houseSold();
     function listHouse(string memory _name, string memory _location, uint256 _amount, string memory _houseType) onlyOwner external {
        if(msg.sender == address(0)) revert("Address zero detected");
        if (_amount == 0) revert("Amount must be greater than zero");

        houseCount+=1;

        House storage hse = house[houseCount];
        hse.amount = _amount;
        hse.houseType = _houseType;
        hse.Name = _name;
        hse.Location = _location;
        hse.id = houseCount;
        hse.isAvailable = true;
        hse.owner = msg.sender;


        emit houseListedForSale();

     }

      function checkHouseList(uint _id) external view returns(House memory){
        House storage hse = house[_id];
        return hse;

     }

     function buyHouse(uint _id) external payable {
        House storage hse = house[_id];
        if(msg.value < hse.amount) revert("insufficient amount");
        if(msg.value != 1e18+ hse.amount) revert("Must pay required amount");
    
    //transfer ether to the owners account
        // (bool transfered,)=(address(this)).call{value:1e18}("");
        //  if(!transfered)revert("Declined");

        //This line of code receives the amount required for the asset and transfers the balance to the owners address
        msg.value - hse.amount;
        (bool success,)= (hse.owner).call{value:hse.amount}("");
        if(!success)revert("Failed");




     }

    





}