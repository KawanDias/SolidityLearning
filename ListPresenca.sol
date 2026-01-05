// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Presenca{
    address[] public lista;

    function assinar() public{
        lista.push(msg.sender);
    }

    function totalPresencas() public view returns (uint){
            return lista.length;
    }
}