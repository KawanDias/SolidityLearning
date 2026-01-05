// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Crowdfunding{
    uint public meta = 5 ether;
    address public dono;

    struct Doador{
        uint valor;
        bool vip;
    }

    mapping(address => Doador) public doadores;

    constructor(){
        dono = msg.sender; 
    }

    function doar() public payable{
    doadores[msg.sender].valor += msg.value;

        if(doadores[msg.sender].valor >= 1 ether){
            doadores[msg.sender].vip = true;
        }
      }

      function sacarTudo() public{
        require(msg.sender == dono, "Voce nao e o dono!");
        require(address(this).balance >= meta, "Meta nao atingida");

        (bool sucesso, ) = payable(dono).call{value: address(this).balance}("");
        require(sucesso, "A trasnferencia falhou");

    }
}