// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract BancoSimples{

    mapping(address => uint) public saldos;

    function depositar (uint _quantidade) public {
        saldos[msg.sender] = saldos[msg.sender] + _quantidade;
    }

    function verMeuSaldo() public view returns (uint){
        return saldos[msg.sender];
    }
}