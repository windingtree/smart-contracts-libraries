// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";

/**
 * @dev Easy configurable and upgradeable token
 */
contract ERC20Initializable is ERC20Upgradeable {

    /// @dev Token constructor
    function initialize(
      string memory name,
      string memory symbol,
      uint8 decimals,
      uint256 supply
    ) public initializer {
        __ERC20_init(name, symbol);
        _setupDecimals(decimals);
        _mint(msg.sender, supply);
    }
}
