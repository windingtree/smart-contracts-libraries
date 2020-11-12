// SPDX-License-Identifier: MIT;
pragma solidity 0.5.17;

import "@openzeppelin/contracts/introspection/ERC165.sol";

/**
 * @dev Custom implementation of the {IERC165} interface.
 * This is contract implemented by OpenZeppelin but extended with
 * _removeInterface function
 */
contract ERC165Removable is ERC165 {
    /**
     * @dev Removes support of the interface
     * @param interfaceId Interface Id
     */
    function _removeInterface(bytes4 interfaceId) internal {
        require(_supportedInterfaces[interfaceId], "ERC165: unknown interface id");
        _supportedInterfaces[interfaceId] = false;
    }
}
