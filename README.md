# RISEIN-BNBCHAIN-FINAL-PROJECT

The decentralized marketplace smart contract system is a blockchain-based application developed in Solidity. It enables users to securely and transparently list, buy, and sell items on the blockchain. The system incorporates features such as listing items with a specified fee, purchasing available items, withdrawing balances, and setting listing fees. Basic security measures, including authentication through the contract owner, have been implemented to prevent unauthorized access to sensitive functions. This project provides a foundation for building decentralized and trustless marketplaces on blockchain technology.



The decentralized marketplace smart contract system provides the following functionalities and utilities:

Listings:

1. Users can list new items for sale on the marketplace.
The listNewItem function allows users to specify the item's name and price, while also requiring a listing fee.
Each listed item is assigned a unique identifier (itemId).
Purchasing Items:

2. Users can purchase available items from the marketplace.
The purchaseItem function enables buyers to acquire an item by providing the item's ID and sending sufficient funds to cover the item's price.
The purchase triggers a transfer of funds to the seller, marking the item as no longer available.
Withdrawal of Balances:

3. The contract owner can withdraw the accumulated balance in the contract.
The withdrawBalance function allows the owner to retrieve listing fees and proceeds from item purchases.
Setting Listing Fee:

4. The contract owner has the authority to set or update the listing fee.
The setListingFee function enables adjustments to the fee required for listing items.
Security Measures:

5. The contract incorporates basic security measures to restrict access to sensitive functions.
The onlyOwner modifier ensures that certain functions can only be executed by the owner of the contract.
The validateListingFee modifier ensures that the correct listing fee is provided when listing a new item.
Events:

The contract emits events (ItemListed and ItemPurchased) for transparency and tracking purposes.
These events capture important information such as item IDs, buyer and seller addresses, item names, and prices.
This decentralized marketplace smart contract system serves as a foundation for building decentralized applications (DApps) that facilitate secure, transparent, and trustless transactions between users in a decentralized environment. Developers can extend and enhance these functionalities based on specific project requirements.
