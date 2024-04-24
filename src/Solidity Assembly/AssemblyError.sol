// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract AssemblyError {
    function yul_revert(uint256 x) public pure returns (bool z) {
        z;
        assembly {
            // revert(p, s) - end execution
            //                revert state changes
            //                return data mem[p…(p+s))
            if gt(x, 10) {
                z := true
                revert(0, 0)
            }
        }
    }
}
