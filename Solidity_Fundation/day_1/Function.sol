// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


contract my_Function {

uint public  num = 1;

/**
1.记住 internal/public/external/private 与 view/pure/payable的区别
2.学会函数参数以及返回值的常规用法
*/


function minus(uint n) internal view returns(uint result){       
    result = num - n;
}

function getMinus () external view returns(uint a) {

  a = minus(1);

 }

function paySth () external payable returns(uint balance){

   return  address(this).balance;

}


}




