// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract AssemblyLoop {
    error AssemblyLoop__XMustBeGreaterThanZero();

    function yul_for_loop() public pure returns (uint256 z) {
        assembly {
            for { let i := 0 } lt(i, 10) { i := add(i, 1) } { z := add(z, i) }
        }
    }

    function yul_while_loop() public pure returns (uint256 z) {
        assembly {
            let i := 0
            for {} lt(i, 5) {} {
                i := add(i, 1)
                z := add(z, i)
            }
        }
    }

    function sum(uint256 n) public pure returns (uint256 z) {
        assembly {
            for { let i := 0 } lt(i, n) { i := add(i, 1) } { z := add(z, i) }
        }
    }

    // Calculate x**n where n = 2**k
    // x > 0
    // No overflow check
    function pow2k(uint256 x, uint256 n) public pure returns (uint256 z) {
        if (x < 0) {
            revert AssemblyLoop__XMustBeGreaterThanZero();
        }

        assembly {
            if mod(n, 2) { revert(0, 0) }
            switch n
            case 0 { z := 1 }
            default { z := x }
            for {} gt(n, 1) {} {
                if mod(n, 2) { revert(0, 0) }
                z := mul(z, z)
                n := div(n, 2)
            }
        }
    }
}
