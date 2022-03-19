// we will pass the svg here 
// output an NFt Uri with this svg code
// Storing all the nft metadata on chain

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0   ;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

import "base64-sol/base64.sol";

contract SVGNFT is ERC721URIStorage{
    uint public tokenCounter;

    event SVGCreated(
        uint indexed tokenId,
        string tokenURI
    );

    constructor() ERC721("SVGNFT","svgNFT"){

    }

    function create(string memory svg) public{
        _safeMint(msg.sender,tokenCounter);
        // image URI
        string memory imageURI= svgToImageURI(svg);
        // tokenURI 
        string memory tokenURI= formatTokenURI(imageURI);
        _setTokenURI(tokenCounter,tokenURI);
        emit SVGCreated(tokenCounter,tokenURI);
        tokenCounter= tokenCounter+1;
    }

    function svgToImageURI(string memory svg)public pure returns(string memory){
        string memory baseURL="data:image/svg+xml;base64,";
        string memory svgBase64Encoded= Base64.encode(bytes(string(abi.encodePacked(svg))));
        string memory imageURI= string(abi.encodePacked(baseURL,svgBase64Encoded));
        return imageURI;
    }

    function formatTokenURI(string memory _imageURI)public pure returns(string memory){
        string memory baseURL="data:application/json;base64,";

        string memory base64Encoded=
            Base64.encode(bytes(abi.encodePacked(
                '{"name": "SVGNFT", ',
                '"description": "An NFT of the SVG Collection", ',
                '"attributes": "", ',
                '"image": "', _imageURI, '"}'
            )));
        
        return string(abi.encodePacked(baseURL,base64Encoded));

    }
}

