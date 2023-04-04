// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Test, expect} from "vulcan/test.sol";
import {magic} from "src/Magic.sol";

contract MagicTest is Test {
    function setUp() public {
    }

    function testMagic() public {
        address addr = address(0x1234);
        magic("Send 1 ETH to 0x1234");
        expect(addr.balance).toEqual(1 ether);
    }
}
