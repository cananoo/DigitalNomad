// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

/**
映射-mapping
*/

contract Mapping {

mapping(uint => address) public idToAddress; //id 到 地址  ，key不能为自定义类型; 不能用于public函数的参数及返回值

function changeValue(uint _id, address _address) public {

      idToAddress[_id] = _address;

}


}