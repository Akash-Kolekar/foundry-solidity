// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {GasGolf} from "../../src/Gas Optimization/GasGolf.sol";
import {Script} from "forge-std/Script.sol";

contract DeployGasGolf is Script {
    function run() external returns (GasGolf gasGolf) {
        vm.startBroadcast();
        gasGolf = new GasGolf();
        vm.stopBroadcast();
        return gasGolf;
    }
}
