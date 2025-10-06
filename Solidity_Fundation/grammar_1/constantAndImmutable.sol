// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

/**
不可改-constant(可用于任意变量)且需声明时即赋值-immutable(只可数值类型-uint/address)可在构造函数时赋值
*/

contract CI{

uint constant public a = 10;
string constant public b = "10";

uint immutable public  c;

//immutable 在constructor中赋值
constructor() {
c = 20;
}
}
