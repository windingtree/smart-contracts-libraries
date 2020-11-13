// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "@openzeppelin/contracts/GSN/Context.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @dev Easy configurable token
 */
contract ERC20Configurable is Context, ERC20 {

    /// @dev Token constructor
    constructor(
      string memory name,
      string memory symbol,
      uint8 decimals,
      uint256 supply
    ) public ERC20(name, symbol) {
        _setupDecimals(decimals);
        _mint(msg.sender, supply);
    }
}
