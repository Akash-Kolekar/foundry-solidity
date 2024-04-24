// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test} from "forge-std/Test.sol";
import {DeployMSB} from "../../script/DeployMSB.s.sol";
import {MostSignificantBit} from "../../src/MostSignificantBit.sol";

contract MSBTest is Test {
    DeployMSB public deployer;
    MostSignificantBit public mostSignificantBit;

    function setUp() public {
        deployer = new DeployMSB();
        mostSignificantBit = deployer.run();
    }

    function testMSBof8() public view {
        assertEq(mostSignificantBit.findMostSignificantBit(8), 3);
    }

    function testMSBof7() public view {
        assertEq(mostSignificantBit.findMostSignificantBit(7), 2);
    }

    function testMSBof16() public view {
        assertEq(mostSignificantBit.findMostSignificantBit(16), 4);
    }
}
