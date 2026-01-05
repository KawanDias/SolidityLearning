//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SistemaVotacao{
    enum Status {ABERTA, FECHADA}
    Status public statusAtual;

    struct Candidato {
        string nome;
        uint votos;
    }

    Candidato[] public candidatos;
    address public dono;

    constructor(){
        dono = msg.sender;
        statusAtual = Status.FECHADA; 
    }

    function adicionarCandidato(string memory _nome) public {
        require(msg.sender == dono, "Apenas o  dono pode adicionar");
        candidatos.push(Candidato(_nome, 0));
    }

    function mudarStatus()public {
        require(msg.sender == dono, "Apenas o dono muda o status");
        if (statusAtual == Status.FECHADA){
            statusAtual = Status.ABERTA;
        } else{
            statusAtual = Status.FECHADA;
        }
    }

    function votar(uint _id) public {
        require(statusAtual == Status.ABERTA, "A votacao esta fechada!");
        candidatos[_id].votos += 1;
    }
}