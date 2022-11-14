// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

//Deployed at Goerli: 0xD438283946FdD8dF98F0481dD73Ff9C3BebA445D

contract BuyMeCoffee {
    event NewMemo(
        address indexed from,
        uint256 timestamp,
        string name,
        string message
    );

    struct Memo {
        address from;
        uint256 timestamp;
        string name;
        string message;
    }

    Memo[] memos;

    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function buyCoffee(string memory _buyer, string memory _message)
        public
        payable
    {
        require(msg.value > 0, "Invalid amount of eth");
        memos.push(Memo(msg.sender, block.timestamp, _buyer, _message));
        emit NewMemo(msg.sender, block.timestamp, _buyer, _message);
    }

    function withdrawTips() public {
        require(owner.send(address(this).balance));
    }

    function getMemos() public view returns (Memo[] memory) {
        return memos;
    }
}
