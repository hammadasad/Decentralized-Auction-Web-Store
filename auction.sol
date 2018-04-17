pragma solidity ^0.4.0;

contract Auction {

    // properties of the smart contract

    // hash of beneficiary
    address public beneficiary;

    uint public auctionStart; // auction start time
    uint public biddingTime;  // bidding start time

    // current state
    address public highestBidder;
    uint public highestBid;

    // withdrawals mapping
    mapping(address -> uint) pendingReturns

    // Has the auction ended?
    bool isEnded

    // Events
    event HighestBidIncreased(address bidder, uint amount);
    event AuctionEnded(address winner, uint amount);

    // Constructor
    function Auction(uint _biddingTime, address _beneficiary) {
        beneficiary = _beneficiary;
        biddingTime = _biddingTime;
        auctionStart = now;
    }


}

