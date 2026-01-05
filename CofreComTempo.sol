// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


//abertura do contrato + declaração das variáveis, dono e tempoParaSaque
contract CofreComTempo{
    address public dono;
    uint public tempoParaSaque;

//construtor para definir o dono

    constructor() {
        dono = msg.sender;
    }

//função para fazer o depósito
    function depositar() public payable{
        tempoParaSaque = block.timestamp + 1 minutes;
    }

//função para fazer o saque
    function sacar() public{
        require(msg.sender == dono, "Voce nao e o dono!");
        require(block.timestamp >= tempoParaSaque, "O dinheiro ainda esta preso!");

        payable(dono).transfer(address(this).balance);
    }


//função que calcula o rempo restante, se o saque for feito enquanto o cooldown estiver ativo, retornará erro
    function tempoRestante() public view returns (uint) {
        if (block.timestamp >= tempoParaSaque){
            return 0;
        } else{
            return tempoParaSaque - block.timestamp;
        }
    }
}