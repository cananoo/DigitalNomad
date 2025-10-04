// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Var_type {

// 布尔
bool public  a = (1 == 2);

// 整型
int public b = -1;
uint public c = 2**2;
uint256 public d = 114514;

// 地址
address public  _address = 0x1234567890123456789012345678901234567890 ;//20 字节 - 40位16进制
address payable public _address2 = payable(_address);

// 定长数组

bytes32 public e = "Solidity"; //共32字节，每个字符占1个字节
bytes1 public f = e[0]; //e的第一个字节

// 枚举

enum Example {apple,android,windows} // 用unit 0,1,2表示为apple,android,windows
Example example = Example.apple;
uint public num = uint(example); //枚举可以显式地和uint相互转换



}