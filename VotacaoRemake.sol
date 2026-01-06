// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract VotacaoRemake{

    /* adicionei esse mapping para vincular o endereço da carteira do eleitor a um status,
    no caso, se votou ou não.
    */
    mapping(address => bool) public jaVotou;

    enum Status {ABERTA, FECHADA}
    Status public statusAtual;

    struct Candidato{
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
        require(msg.sender == dono, "Apenas o dono pode adicionar!");
        candidatos.push(Candidato(_nome, 0));
    }

    function mudarStatus() public{
     require(msg.sender == dono, "Apenas o dono pode mudar o STATUS!");
     if (statusAtual == Status.FECHADA){
        statusAtual = Status.ABERTA;
     } else{
        statusAtual = Status.FECHADA;
     }
}

    function votar(uint _id) public {
    require(statusAtual == Status.ABERTA, "A votacao esta fechada!");
    candidatos[_id].votos += 1;

    /* aqui eu criei uma condicional chamada "jaVotou", que deve estar no status "FALSE" para
    que o eleitor possa votar, se não, a mensagem da string o bloqueará de votar novamente*/
    require(jaVotou[msg.sender] == false, "Voce ja votou nesta eleicao!");

    /*Aqui será incluído uma "unidade de voto" ao ID do eleitor, fazendo com que o Status de "jaVotou
    seja "TRUE""*/
    candidatos[_id].votos += 1;
    jaVotou[msg.sender] = true;
    } 
}