// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract AssemblyIf {
    function yul_if(uint256 x) public pure returns (uint256 z) {
        assembly {
            if lt(x, 10) { z := 99 }
        }
    }

    function yul_switch(uint256 x) public pure returns (uint256 z) {
        assembly {
            switch x
            case 1 { z := 10 }
            case 2 { z := 20 }
            default { z := 0 }
        }
    }

    function yul_min(uint256 x, uint256 y) public pure returns (uint256 z) {
        z = y;
        assembly {
            if lt(x, y) { z := x }
        }
    }

    function yul_max(uint256 x, uint256 y) public pure returns (uint256 z) {
        assembly {
            switch gt(x, y)
            case 1 { z := x }
            default { z := y }
        }
    }
}
