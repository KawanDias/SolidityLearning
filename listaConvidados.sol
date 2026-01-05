// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

// início do contrato
contract ListaConvidados{

    string[] public convidados;
    address public dono;

    constructor(){
        dono = msg.sender;
    }

    function adicionar(string memory _nome) public{
        convidados.push(_nome);
    }

    function verUltimoConvidado() public view returns(string memory){
        require(msg.sender == dono, "Apenas o dono pode ver!");

        // Pega o último índice
        uint ultimoIndice = convidados.length - 1;

        // Retorna o nome que está naquela posição
        return convidados[ultimoIndice];
    }
}