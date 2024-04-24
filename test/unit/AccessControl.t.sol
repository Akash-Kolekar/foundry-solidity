// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {AccessControl} from "../../src/AccessControl.sol";
import {DeployAccessControl} from "../../script/DeployAccessControl.s.sol";

contract AccessControlTest is Test {
    AccessControl public accessControl;
    DeployAccessControl public deployer;

    address public user = address(1);

    function setUp() public {
        deployer = new DeployAccessControl();
        accessControl = deployer.run();
    }

    function testCheckOwnerAddrOfAccessControl() public {
        vm.startPrank(user);
        assertEq(user, accessControl.owner());
        vm.stopPrank();
    }
}
