// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {ERC20} from "../../src/Tokens/ERC20.sol";
import {DeployERC20} from "../../script/DeployERC20.s.sol";
import {Test} from "forge-std/Test.sol";

contract ERC20Test is Test {
    DeployERC20 public deployer;
    ERC20 public erc20;

    function setUp() public {
        deployer = new DeployERC20();
        erc20 = deployer.run();
    }

    function testTotalSupply() public view {
        assertEq(erc20.totalSupply(), 0);
    }

    function testTransfersTokens() public {}
}
