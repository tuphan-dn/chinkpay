// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import '@chainlink/contracts/src/v0.8/automation/AutomationCompatible.sol';

contract Subscription is AutomationCompatibleInterface {
  address payable public owner;

  uint256 public immutable interval;
  uint256 public lastTimeStamp;
  uint256 public counter;

  constructor() payable {
    owner = payable(msg.sender);

    interval = 60;
    lastTimeStamp = block.timestamp;
    counter = 0;
  }

  modifier isOutdated() {
    require(
      (block.timestamp - lastTimeStamp) > interval,
      'The current state is still updated.'
    );
    _;
  }

  function checkUpkeep(
    bytes calldata
  )
    external
    view
    override
    isOutdated
    returns (bool upkeepNeeded, bytes memory performData)
  {
    return (true, new bytes(0));
  }

  function performUpkeep(bytes calldata) external override isOutdated {
    lastTimeStamp = block.timestamp;
    counter = counter + 1;
  }
}
