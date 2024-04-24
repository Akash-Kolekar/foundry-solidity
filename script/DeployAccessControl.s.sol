// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";
import {AccessControl} from "../src/AccessControl.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract DeployAccessControl is Script {
    address public user = address(1);

    function run() external returns (AccessControl) {
        vm.startBroadcast(user);
        AccessControl accessControl = new AccessControl();
        vm.stopBroadcast();
        return accessControl;
    }
}
