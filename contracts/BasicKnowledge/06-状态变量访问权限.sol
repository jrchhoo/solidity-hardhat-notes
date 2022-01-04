// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Demo{

    uint public a = 1;
    uint private b = 2;
    uint internal c = 3;
    uint d = 4;

    function call() public virtual{
        a = 11;
        b = 22;
        c = 33;
        d = 44;
    }
   
}

contract Demo2{

    function call() public {
        Demo demo = new Demo();
        demo.a;
        // 不能被外部引用
        // demo.b;
        // demo.c;
        // demo.d;
    }
}

contract Demo3 is Demo{

    function call() public override {
        a = 11;

        // private 不能被引用
        // b = 22;

        c = 33;
        d = 44;
        
    }
   
}