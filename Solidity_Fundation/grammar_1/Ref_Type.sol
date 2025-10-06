// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

/*
1.变量存储位置
2.作用域(全局变量/局部变量/状态变量)
3.时间和以太单位
4.引用类型（数组/结构体）

*/

contract Reference {

// storage(状态变量)/memory(参与与临时变量)/calldata(不可修改) -前者在链上，后两者相当于在内存里。 --只能在函数内使用

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

//数组-定长字节数组如bytes1 bytes32等为值类型，定长数组int[x],address[x]等及可变长数组(动态数组)int[],address[]，特殊的为bytes为引用类型，
//bytes不能写为bytes[],且其比bytes1[]更省gas.

//固定长度数组
uint[8] public  array1 = [uint(1),2,3,4,5,6,7,8];   //[uint(1),2,3,4,5,6,7,8]的中值类型按第一个的值类型，否则为uint8
uint[] public  array4;

function Array() public  returns (uint,uint,uint){

//memory声明的动态数组用new创建，且必须声明长度。
uint[] memory array3 = new uint[](3);   //方法内的引用类型都要声明存储域

array4 = array1; 

array3[0] = 10;
array4.push(20);
array4.push();
array4.pop();  //无返回值

uint num = array4.length;

return (array3[0],num,array4[num - 1]);


}

//结构体及赋值的四种方式
//声明
struct Student {
 uint id;
 uint age;
}

Student student;

//赋值
function giveValue() external {
//1. student.id = 10; student.age = 20;
//2. Student storage _student = student; // 创建一个引用,再按1赋值
//3. student = Student(10,20);
//4. student = Student({id:10,age:20});

}






}