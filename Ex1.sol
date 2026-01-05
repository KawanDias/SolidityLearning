// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Contador{

    uint public contagem;

    function incrementar() public{
        contagem = contagem + 1;
    }

    function decrementar() public{
        require(contagem > 0, "A contagem nao pode ser menor que zero!");
        contagem = contagem - 1;
    }
    }