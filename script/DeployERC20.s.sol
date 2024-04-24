// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Script} from "forge-std/Script.sol";
import {ERC20} from "../src/Tokens/ERC20.sol";

contract DeployERC20 is Script {
    function run() public returns (ERC20) {
        vm.startBroadcast();
        ERC20 erc20 = new ERC20("BadMan", "BD", 18);
        vm.stopBroadcast();
        return erc20;
    }
}
