// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Estacionamento{

    mapping(address => bool) public estaEstacionado;

    function estacionar() public payable{
        require(msg.value == 1 ether, "Pague extamente 1 ether") ;

        estaEstacionado[msg.sender] = true;
    }

    function sair() public{
        require(estaEstacionado[msg.sender] == true, "Voce nao esta estacionado");

    estaEstacionado[msg.sender] = false;        
    }
} 