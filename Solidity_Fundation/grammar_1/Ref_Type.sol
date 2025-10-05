// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;


contract Reference {

// storage(状态变量)/memory(参与与临时变量)/calldata(不可修改) -前者在链上，后两者相当于在内存里。 

uint[] public x = [1,2,3];

function changeArray() public {


 uint[] storage y = x;     //赋值时-只有storage引用变量能够获取真实引用。其余均为复制，修改影像不了链上引用。

 y[1] = 250;

}

// 作用域-状态变量/局部变量/全局变量 这里展示全局变量
function global() external  returns(address,uint,bytes memory) {
address a = msg.sender; //调用者地址
uint b = block.number; //当前区块高度
bytes memory c = msg.data; //请求数据

return (a,b,c);

}

function global2() external   returns(bytes32,address,uint,uint){
bytes32 d = blockhash(block.number - 1); //指定区块的哈希
address payable e = block.coinbase; //当前区块矿工地址
uint f = block.gaslimit; //当前区块的gaslimit
uint g = block.timestamp; //当前区块的时间戳

return (d,e,f,g);
}

function global3() external  payable returns(uint,bytes4,uint) {

uint h = gasleft(); // 交易初始设定的gaslimit的剩余值
bytes4 i = msg.sig; //调用函数的签名 mig.data的前四个字节
uint j = msg.value; // 当前交易发送的wei值

return (h,i,j);

}

// 币单位和时间单位

function UnitAndTime() external pure returns (bool,bool,bool) {

return (1 ether == 1e18 wei,1 gwei == 1e9 wei,1 seconds == 1);


}

}