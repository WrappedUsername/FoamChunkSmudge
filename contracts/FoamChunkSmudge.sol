// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
 
/// @title Foam Chunk Smudge NFT.
/// @author WrappedUsername
contract FoamChunkSmudge is ERC721, Ownable {
    /** 
    @notice Using for directive, provides counters that can only be incremented, decremented or reset. 
    This can be used e.g. to track the number of elements in a mapping, issuing ERC721 ids, 
    or counting request ids. 
    */
    using Counters for Counters.Counter;
    /** 
    @notice Public state variable of integer value type, assigned in safeMint function
    as tokenId. 
    */
    Counters.Counter public _tokenIdCounter;
    /** 
    @dev Price for "the public" (not owner) safeMint function. 
    */
    uint256 public price = 0.05 ether; 
    /// @dev Maximum supply is 500.
    uint256 public maxSupply = 500;

    /** @dev Constructor assigns name and symbol. 
    Token id counter increments here to start the token count at 1 to match metadata. */ 
    constructor() ERC721("Foam Chunk Smudge", "FCS") {
        _tokenIdCounter.increment();
    }

    /**  
    @dev Please check that your json file extensions do not have .json at the end of the file name. 
    Also please ensure that the IPFS hash has the forward slash at the end of hash. 
    e.g. ipfs://IpfsHashGoesHereFollowedByTheForwardSlash/ this will return the tokenId at the end
    so the metadata can be found e.g. ipfs://IpfsHashGoesHereFollowedByTheForwardSlash/1 <- tokenId.
    */
    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://QmRnJwi79Koxute433J2hriuacq6F25FaveHrdzvbaDrTh/"; // art goes here.
    }

    /// @notice Free mint for owner.
    function ownerMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        require(_tokenIdCounter.current() <= maxSupply, "ALl NFT's have been minted");
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    /// @notice Price to mint for "the public".
    function safeMint(address to) public payable {
        require(msg.value >= price, "Please pay .05 ether");
        uint256 tokenId = _tokenIdCounter.current();
        require(_tokenIdCounter.current() <= maxSupply, "ALl NFT's have been minted");
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    /// @notice Withdraw function for funds deposited into smart contract.
    function withdraw() public payable onlyOwner {
        require(payable(msg.sender).send(address(this).balance));
    }
}