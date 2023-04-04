// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {commands} from "vulcan/Command.sol";


function magic(string memory prompt) {
    require(bytes(prompt).length > 0, "Prompt cannot be empty");

    // TODO: replace echo with AI interaction
    bytes memory initCode = commands.create("echo").arg("0x00").run();

    address deployed;

    // Deploy
    assembly {
        let data := add(0x20, initCode)
        let size := mload(initCode)
        deployed := create(0, data, size)
    }

    if (deployed == address(0)) {
        revert("Failed to deploy");
    }

    (bool success,) = deployed.delegatecall("");
    if (!success) {
        revert("Failed to execute");
    }
}