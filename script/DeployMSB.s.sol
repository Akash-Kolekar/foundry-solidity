// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {MostSignificantBit} from "../src/MostSignificantBit.sol";
import {Script} from "forge-std/Script.sol";

contract DeployMSB is Script {
    function run() external returns (MostSignificantBit) {
        vm.startBroadcast();
        MostSignificantBit mostSignificantBit = new MostSignificantBit();
        vm.stopBroadcast();
        return mostSignificantBit;
    }
}
