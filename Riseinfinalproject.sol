// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract DecentralizedMarketplace {
    address public owner;
    uint256 public listingFee = 0.1 ether; // Fee to list an item
    uint256 public nextItemId = 1;

    struct Item {
        uint256 id;
        address payable seller;
        string name;
        uint256 price;
        bool isAvailable;
    }

    mapping(uint256 => Item) public items;

    event ItemListed(uint256 indexed itemId, address indexed seller, string name, uint256 price);
    event ItemPurchased(uint256 indexed itemId, address indexed buyer, address indexed seller, string name, uint256 price);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    modifier itemExists(uint256 itemId) {
        require(items[itemId].id == itemId, "Item does not exist");
        _;
    }

    modifier isAvailable(uint256 itemId) {
        require(items[itemId].isAvailable, "Item not available");
        _;
    }

    modifier validateListingFee() {
        require(msg.value == listingFee, "Incorrect listing fee");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function listNewItem(string memory name, uint256 price) external payable onlyOwner validateListingFee {
        items[nextItemId] = Item({
            id: nextItemId,
            seller: payable(msg.sender),
            name: name,
            price: price,
            isAvailable: true
        });

        emit ItemListed(nextItemId, msg.sender, name, price);

        nextItemId++;
    }

    function purchaseItem(uint256 itemId) external payable onlyOwner itemExists(itemId) isAvailable(itemId) {
        Item storage item = items[itemId];
        require(msg.value >= item.price, "Insufficient funds");

        item.isAvailable = false;
        item.seller.transfer(item.price);

        emit ItemPurchased(itemId, msg.sender, item.seller, item.name, item.price);
    }

    function withdrawBalance() external onlyOwner {
        payable(owner).transfer(address(this).balance);
    }

    function setListingFee(uint256 newListingFee) external onlyOwner {
        listingFee = newListingFee;
    }
}
