// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract GasGolf {
    // start - 34252
    // use calldata - 35004
    // Load state variables to memory - 34779
    // Short circuit - 34104
    // loop increment - 34104
    // cache array Length - 34112
    // load array elements to memory - 33115
    // uncheck i overflow/underfolw - 33115

    uint256 public total;
    // gas optimized
    // [1, 2, 3, 4, 5, 100]

    function sumIfEvenAndLessThan99(uint8[6] calldata nums) external {
        uint256 _total = total;
        uint256 len = nums.length;

        for (uint256 i = 0; i < len;) {
            uint256 num = nums[i];
            if (num % 2 == 0 && num < 99) {
                _total += num;
            }
            unchecked {
                ++i;
            }
        }

        total = _total;
    }
}
