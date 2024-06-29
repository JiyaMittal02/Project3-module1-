# SimpleBank Contract

## Overview

The `SimpleBank` contract is a basic Solidity smart contract . It allows users to deposit and withdraw Ether, with simple error handling mechanisms. The contract maintains a balance for each address, allowing users to manage their funds directly on the blockchain.

## Description

The `SimpleBank` contract provides a minimal example of a smart banking system where users can deposit and withdraw Ether. It includes basic functionalities to handle deposits and withdrawals, with error checking using `require` and `assert` statements, and demonstrates how to revert transactions with a custom error message.

### Features

- **Deposit Funds:** Users can deposit Ether into the contract.
- **Withdraw Funds:** Users can withdraw Ether from their balance.
- **Error Handling:** Includes a function to demonstrate transaction reversion.

## Getting Started


1. **Open Remix IDE:**
   

2. **Load the Contract:**
   - Open Remix IDE and create a new file named `SimpleBank.sol`.
   - Write the contract code in this file.

### Executing the Program

To deploy and interact with the `SimpleBank` contract using Remix IDE:

1. **Compile the Contract:**
   - Go to the **"Solidity Compiler"** tab.
   - Select the appropriate compiler version (e.g., `0.8.0`).
   - Click **"Compile SimpleBank.sol"**.

2. **Deploy the Contract:**
   - Navigate to the **"Deploy & Run Transactions"** tab.
   - Ensure **"Environment"** is set to **"Remix VM (London)"**.
   - Click **"Deploy"**.

3. **Interact with the Contract:**
   - After deployment, the contract functions will appear under **"Deployed Contracts"**.
   - Use **"deposit"** to add Ether, **"withdraw"** to remove Ether, and **"triggerRevert"** to test the revert functionality.


## Help

### Common Issues

- **Insufficient Funds Error:**
  - Ensure you have sufficient Ether in the account you're using for deployment and transactions.

- **Revert Issues:**

## Authors
Jiya Mittal

- **Dominique Pizzie**
  - [@DomPizzie](https://twitter.com/DomPizzie)



