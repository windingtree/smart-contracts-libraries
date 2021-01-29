// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "@openzeppelin/upgrades-core/contracts/Initializable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @dev Easy configurable and upgradeable token
 */
contract ERC20Upgradeable is Initializable, ERC20 {

    /// @dev Token constructor
    initialize(
      string memory name,
      string memory symbol,
      uint8 decimals,
      uint256 supply
    ) public initializer {
        _name = name;
        _symbol = symbol;
        _setupDecimals(decimals);
        _mint(msg.sender, supply);
    }
}
