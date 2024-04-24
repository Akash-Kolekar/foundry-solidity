// SPDX-License-Identifier: MIT

// Layout of Contract:
// version
// imports
// interfaces, libraries, contracts
// errors
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

pragma solidity ^0.8.24;

/**
 * @title AccessControl
 * @author Akash Kolekar
 * This contract is for managing the roles of the company for the employee. It has mapping of roles to employee(address) and the only authorized person can Grant role to the employee and only owner can set the manager role.
 */
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract AccessControl is Ownable {
    error AccessControl__MustBeManager();

    address public s_manager;
    address private s_owner;
    mapping(string role => mapping(address employee => bool hasAccess)) public s_roles;

    // role type can be a bytes32 for that you will need a bytes32 hash of the role ahead of the granting role to someone
    // bytes32 private constant ADMIN = keccak256(abi.encodePacked("ADMIN"));
    // bytes32 private constant USER = keccak256(abi.encodePacked("USER"));

    event GrantRole(string indexed role, address indexed account);
    event RevokeRole(string indexed role, address indexed account);

    modifier onlyManager(address _manager) {
        if (msg.sender != address(_manager)) {
            revert AccessControl__MustBeManager();
        }
        _;
    }

    constructor() Ownable(msg.sender) {
        s_owner = msg.sender;
    }

    function grantRole(string memory _role, address _account) external onlyManager(s_manager) {
        s_roles[_role][_account] = true;
        emit GrantRole(_role, _account);
    }

    function revokeRole(string calldata _role, address _account) external onlyManager(s_manager) {
        s_roles[_role][_account] = false;
        emit GrantRole(_role, _account);
    }

    function _setManger(address _manger) external onlyOwner {
        s_manager = _manger;
    }

    function owner() public view override returns (address) {
        return s_owner;
    }
}
