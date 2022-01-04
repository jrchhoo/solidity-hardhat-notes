// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Demo {
    // 内部和外部都可以访问，可继承
    function testPublic() public pure returns (string memory) {
        return "public";
    }

    // 合约内部访问，外部不能访问，可被继承
    function testInternal() internal pure returns (string memory) {
        return "internal";
    }

    // 合约内部访问，外部不能访问，不可被继承
    function testPrivate() private pure returns (string memory) {
        return "private";
    }

    // 合约内部不能访问（但可以用this调用），外部正常访问，可被继承
    function testExternal() external pure returns (string memory) {
        return "external";
    }

    function call() public virtual {
        testPublic();
        testInternal();
        testPrivate();
        this.testExternal();
    }
}

contract Demo1{

    function call() public{
        Demo demo = new Demo();
        demo.testPublic();

        // 不能被外部访问
        // demo.testInternal();
        // demo.testPrivate();

        demo.testExternal();

    }
}

contract Demo2 is Demo{

    function call() public override view{
        testPublic();
        testInternal();

        // 不能被继承
        // testPrivate();

        this.testExternal();
    }
}
