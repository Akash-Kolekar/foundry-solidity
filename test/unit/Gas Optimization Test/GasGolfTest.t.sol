// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {GasGolf} from "../../../src/Gas Optimization/GasGolf.sol";
import {DeployGasGolf} from "../../../script/Deploy Gas Optimization/DeployGasGolf.s.sol";
import {Test, console} from "forge-std/Test.sol";

contract GasGolfTest is Test {
    GasGolf gasGolf;
    DeployGasGolf deployer;

    function setUp() external {
        deployer = new DeployGasGolf();
        gasGolf = deployer.run();
    }

    function testGasSpend() public {
        uint256 gas_start = gasleft();
        console.log(gas_start);
        gasGolf.sumIfEvenAndLessThan99([1, 2, 3, 4, 5, 100]);
        uint256 gas_left = gasleft();
        console.log(gas_left);
        uint256 gas_spend = gas_start - gas_left;
        console.log(gas_spend);
        // 34252
    }
}
