// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "ds-test/test.sol";
import "../src/StakeCountract.sol";
import "../src/mocks/MockERC20.sol";

contract StakeContractTest is DSTest {
    StakeContract public stakeContract;
    MockToken public mockToken;

    function setUp() public {
        stakeContract = new StakeContract();
        mockToken = new MockToken();
    }

    function stakeTest() public {
        uint256 amount = 10e18;
        mockToken.approve(address(stakeContract), amount);
        bool stakePassed = stakeContract.stake(amount, address(mockToken));
        assertTrue(stakePassed);
    }
}
