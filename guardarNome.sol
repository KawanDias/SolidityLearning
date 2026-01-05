// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Gravador{

    string public ultimoNome;

    function gravar(string memory _nome) public{
       ultimoNome = _nome; 
    }
}