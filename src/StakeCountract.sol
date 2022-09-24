// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

error TransferFailed();

contract StakeContract {
    mapping(address => mapping(address => uint256)) public balances;

    function stake(uint256 amount, address token) external returns (bool) {
        balances[msg.sender][token] += amount;
        bool success = IERC20(token).transferFrom(
            msg.sender,
            address(this),
            amount
        );
        if (!success) revert TransferFailed();
        return success;
    }
}
