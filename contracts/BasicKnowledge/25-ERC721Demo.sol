// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface Demo{

    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);


    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);


    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);


    // 返回由 owner 持有的NFTs的数量
    function balanceOf(address owner) external view returns (uint256 balance);

    // 返回 tokenId 代币持有者的地址
    function ownerOf(uint256 tokenId) external view returns (address owner);

    /*
     * 转移 NFT 所有权
     * 调用者msg.sender应该是当前tokenId的所有者或被授权的地址
     * from 必须是 tokenId的所有者
     * tokenId 应该是当前合约正在监测的NFTs 中的任何一个
     * to 地址不应该为 0
     * 如果_to 是一个合约应该调用其onERC721Received方法, 并且检查其返回值，如果返回值不为bytes4(keccak256("onERC721Received(address,uint256,bytes)"))抛出异常。
    */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /*
     * 转移 NFT 所有权
     */
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    // 授予地址_to具有_tokenId的控制权，方法成功后需触发Approval 事件
    function approve(address to, uint256 tokenId) external;

    // 查询授权
    function getApproved(uint256 tokenId) external view returns (address operator);

    // 授予地址_operator具有所有NFTs的控制权，成功后需触发ApprovalForAll事件
    function setApprovalForAll(address operator, bool _approved) external;

    // 查询授权
    function isApprovedForAll(address owner, address operator) external view returns (bool);

 
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;
}
