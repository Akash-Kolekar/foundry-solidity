// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {AssemblyVariable} from "../../../src/Solidity Assembly/AssemblyVariable.sol";
import {AssemblyIf} from "../../../src/Solidity Assembly/AssemblyIf.sol";
import {AssemblyError} from "../../../src/Solidity Assembly/AssemblyError.sol";
import {Test, console} from "forge-std/Test.sol";
import {DeployAsssembly} from "../../../script/Solidity Assembly/DepolyAssembly.s.sol";

contract AssemblyTest is Test {
    AssemblyVariable public assemblyVariable;
    DeployAsssembly public deployer;
    AssemblyIf public assemblyIf;
    AssemblyError public assemblyError;

    function setUp() public {
        deployer = new DeployAsssembly();
        (assemblyVariable, assemblyIf, assemblyError) = deployer.run();
    }

    function testAssemblyVariables() public view {
        assertEq(assemblyVariable.yul_let(), 456);
    }

    function testYul_If_True() public view {
        assertEq(assemblyIf.yul_if(8), 99);
    }

    function testYul_If_False() public view {
        assertEq(assemblyIf.yul_if(10), 0);
    }

    function testYul_Switch() public view {
        assertEq(assemblyIf.yul_switch(1), 10);
        assertEq(assemblyIf.yul_switch(2), 20);
        assertEq(assemblyIf.yul_switch(3), 0);
        assertEq(assemblyIf.yul_switch(0), 0);
    }

    function testYul_Min() public view {
        assertEq(assemblyIf.yul_min(43, 54), 43);
        assertEq(assemblyIf.yul_min(54, 43), 43);
    }

    function testYul_Max() public view {
        assertEq(assemblyIf.yul_max(43, 54), 54);
        assertEq(assemblyIf.yul_max(54, 43), 54);
    }

    function testYul_Revert() public {
        assertEq(assemblyError.yul_revert(10), false);
        vm.expectRevert();
        assemblyError.yul_revert(11);
    }
}
