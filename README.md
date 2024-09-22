Real Estate Smart Contract
Overview

This Solidity smart contract facilitates the listing and purchasing of real estate properties on the Ethereum blockchain. Property owners can list their houses for sale, and potential buyers can purchase houses by transferring the required amount of Ether.
Features

    House Listing: Only the contract owner can list a house for sale by providing details such as the name, location, house type, and amount.
    House Purchase: Buyers can purchase a listed house by sending the correct Ether amount to the house owner.
    View Listed Houses: Anyone can view details of a listed house by providing the house's unique ID.
    Smart Contract Functions
listHouse

solidity

function listHouse(
    string memory _name, 
    string memory _location, 
    uint256 _amount, 
    string memory _houseType
) external onlyOwner

    Description: Allows the owner of the contract to list a house for sale.
    Parameters:
        _name: Name of the house.
        _location: Location of the house.
        _amount: Selling price in Ether (1 Ether = 1e18 Wei).
        _houseType: Type of house (e.g., apartment, villa, etc.).
    Conditions: Only the owner of the contract can list a house.
    Emits: houseListedForSale event.

checkHouseList

solidity

function checkHouseList(uint _id) external view returns(House memory)

    Description: Retrieves the details of a house by its unique ID.
    Parameters:
        _id: The ID of the house.
    Returns: A House struct containing details like name, location, type, amount, availability, and owner address.

buyHouse

solidity

function buyHouse(uint _id) external payable

    Description: Allows a buyer to purchase a listed house by transferring the required Ether amount.
    Parameters:
        _id: The ID of the house to buy.
    Conditions:
        The buyer must send an amount equal to the price of the house plus 1 Ether (for fees).
        If insufficient or incorrect payment is sent, the transaction is reverted.
        The house owner receives the payment.
    Emits: houseSold event.

Events

    houseListedForSale(): Triggered when a house is successfully listed for sale.
    houseSold(): Triggered when a house is sold.

Error Handling

    Reverts if a listed house has an invalid ID.
    Reverts if the buyer sends insufficient Ether.
    Reverts if the transaction fails to transfer Ether to the house owner.

Usage
1. Deploying the Contract

The contract owner deploys the contract, automatically becoming the owner who can list houses.
2. Listing a House

The owner calls the listHouse function to list a house for sale by providing the house details.
3. Buying a House

A buyer calls the buyHouse function and sends the required Ether. If successful, ownership of the house is transferred, and the previous owner receives the payment.
Considerations

    Ensure the contract owner correctly lists house details.
    Buyers must send the correct Ether amount when purchasing a house.

License

This project is licensed under the MIT License.
