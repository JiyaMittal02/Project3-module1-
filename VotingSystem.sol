// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract VotingSystem {
    address public owner;
    bool public electionStarted;
    uint256 public electionEndTime;
    mapping(address => bool) public hasVoted;
    mapping(string => uint256) public votes;
    string[] public candidates;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function addCandidate(string memory name) public onlyOwner {
        require(!electionStarted, "Election already started");
        votes[name] = 0;
        candidates.push(name);
    }

    function startElection(uint256 durationMinutes) public onlyOwner {
        require(!electionStarted, "Election already started");
        electionEndTime = block.timestamp + (durationMinutes * 1 minutes);
        electionStarted = true;
    }

    function vote(string memory candidate) public {
        require(electionStarted, "Election not started");
        require(block.timestamp <= electionEndTime, "Election ended");
        require(!hasVoted[msg.sender], "Already voted");
        hasVoted[msg.sender] = true;
        votes[candidate]++;
    }

    function endElection() public onlyOwner {
        require(electionStarted, "Election not started");
        require(block.timestamp > electionEndTime, "Election not ended");
        electionStarted = false;
    }

    function getWinner() public view returns (string memory) {
        require(!electionStarted, "Election ongoing");
        string memory leadingCandidate;
        uint256 highestVotes;
        for (uint256 i = 0; i < candidates.length; i++) {
            if (votes[candidates[i]] > highestVotes) {
                highestVotes = votes[candidates[i]];
                leadingCandidate = candidates[i];
            }
        }
        assert(bytes(leadingCandidate).length > 0);
        return leadingCandidate;
    }

    function triggerRevert() public pure {
        revert("This function always reverts");
    }
}
