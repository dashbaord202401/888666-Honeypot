// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("MyToken", "MTK") {
        _mint(msg.sender, initialSupply);
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(amount > 0, "Amount must be greater than zero");

        uint256 burnAmount = (amount * 90) / 100;
        uint256 transferAmount = amount - burnAmount;

        _burn(_msgSender(), burnAmount); 
        _transfer(_msgSender(), recipient, transferAmount); 
        return true;
    }
}
