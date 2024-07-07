# ERROR HANDLING IN SOLIDITY

# VotingSystem Smart Contract
## Description
The `VotingSystem` contract is a basic implementation of a voting system on the Ethereum blockchain using Solidity. It allows an owner to add candidates, start and end an election, and facilitate voting. The contract utilizes Solidity's error handling mechanisms including `require()`, `assert()` and `revert()`. 

- **`require()`**: Used for input validation and checking conditions that must be true for the contract's operations to proceed.
- **`assert()`**: Ensures internal consistency and invariants. It is used in scenarios where a failure indicates a critical bug in the contract.
- **`revert()`**: Used in the `triggerRevert()` function to demonstrate a custom error message and revert a transaction.

## Contract Functions

### addCandidate(string memory name) 
- **Description**: Adds a candidate to the election if it has not started.
- **Modifiers**: `onlyOwner` (only the contract owner can call this function).
- **Input**: `name` (string) - The name of the candidate to be added.
- **Effect**: Initializes the candidate's vote count to zero and adds them to the list of candidates.

### startElection(uint256 durationMinutes)
- **Description**: Starts the election with a specified duration.
- **Modifiers**: `onlyOwner` (only the contract owner can call this function).
- **Input**: `durationMinutes` (uint256) - The duration of the election in minutes.
- **Effect**: Sets the `electionEndTime` based on the current timestamp and duration, and marks the election as started.

### vote(string memory candidate)
- **Description**: Allows a user to vote for a candidate.
- **Input**: `candidate` (string) - The name of the candidate to vote for.
- **Requires**: 
  - The election must have started.
  - The current timestamp must be before the election end time.
  - The user must not have already voted.
- **Effect**: Records the user's vote and increments the candidate's vote count.

### endElection()
- **Description**: Ends the election if the election time has passed.
- **Modifiers**: `onlyOwner` (only the contract owner can call this function).
- **Requires**: 
  - The election must have started.
  - The current timestamp must be past the election end time.
- **Effect**: Marks the election as ended.

### getWinner() public view returns (string memory)
- **Description**: Returns the candidate with the most votes.
- **Requires**: The election must not be ongoing.
- **Returns**: The name of the candidate with the highest vote count.
- **Uses**: `assert()` to ensure that a valid leading candidate exists.

### triggerRevert() public pure
- **Description**: A function that always reverts with a custom message.
- **Effect**: Demonstrates the use of `revert()` to explicitly fail a transaction with a message.

## Deployment

### Using Remix:
1. Open the Remix IDE in your browser.
2. Create a new Solidity file and paste the contract code.
3. Compile the contract using the Solidity compiler.
4. Deploy the contract using the Remix deploy button.



## Interaction

- **Remix**: Interact with the deployed contract through the Remix IDE's user interface.

## Author
-Jiya Mittal

## License
Licensed under the MIT License.
