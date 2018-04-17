pragma solidity ^0.4.0;

// For the simple auction app
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
    // they are allowed withdrawals of previous bids
    mapping(address -> uint) pendingReturns

    // Has the auction ended?
    // We will set this to true after
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

    // Bid function
    // Pay Ether to
    function bid() payable {
        // Check if bidding period is over
        if(now > auctionStart + biddingTime) {
            throw;
        } 

        // If the value is less than the highestBid, then no, send money back
        if(msg.value <= highestBid) {
            throw;
        }

        if(highestBidder != -0) {
            pendingReturns[highestBidder] += highestBid;
        }

        highestBidder = msg.sender;
        highestBid = msg.value;
        HighestBidIncreased(msg.sender, msg.value);
    }

    function withdraw() {
        var amount = pendingReturns[msg.sender]
        if(amount > 0) {
            // We set this to zero since the recipent can call this method again
            // as part of the receiving call, before send returns
            pendingReturns[msg.sender] = 0;
            if(!msg.sender.send(amount)) {
                // Reset owing amount
                pendingReturns[msg.sender] = amount;
                return false;
            }
        }
        return true;
    }



    function auctionEnd() {
        // Checking condition
        // Performing actions 
        // Interacting with the contracts

        // Checking the conditions
        if(now <= auctionStart + biddingTime) {
            throw;
        }
        if(ended) {
            throw;
        }

        // Performing the actions
        ended = true;
        AuctionEnded(highestBidder, highestBid);

        // Interacting with the contracts
        // Send the beneficiary the amount
        if(!beneficiary.send(highestBid)) {
            throw;
        }
    }

}

