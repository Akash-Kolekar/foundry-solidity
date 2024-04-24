// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";
import {AssemblyVariable} from "../../src/Solidity Assembly/AssemblyVariable.sol";
import {AssemblyIf} from "../../src/Solidity Assembly/AssemblyIf.sol";
import {AssemblyError} from "../../src/Solidity Assembly/AssemblyError.sol";

contract DeployAsssembly is Script {
    function run() public returns (AssemblyVariable, AssemblyIf, AssemblyError) {
        vm.startBroadcast();
        AssemblyVariable assemblyVariable = new AssemblyVariable();
        AssemblyIf assemblyIf = new AssemblyIf();
        AssemblyError assemblyError = new AssemblyError();
        vm.stopBroadcast();
        return (assemblyVariable, assemblyIf, assemblyError);
    }
}
