var web3 = require("./getWeb3");
var path = require("path");
var express = require("express");
var cors = require("cors");

var app = express();
app.use(cors());
app.use(express.static(path.join(__dirname, "../public")));

// 指定静态文件路径
app.get("/", function (req, res) {
    // console.log("---begin---");
    res.sendFile(__dirname + "/public/index.html");
});

// 接口 返回所有账户
app.get("/accounts", function (req, res) {
    web3.eth.getAccounts((err, accounts) => {
        if (!err) {
            // console.log(accounts);
            res.send(accounts);
        }
    });
    
});

app.get("/balance", function (req, res) {

    console.log("account_+++++" + req.query.account);
    web3.eth.getBalance(req.query.account, function (err, balance) {
        var ether = web3.utils.fromWei(balance, "ether");
        console.log(ether);
        res.send(ether);
    });
});

app.get("/add", function (req, res) {
    var account_pwd = req.query.account_pwd;
    web3.eth.personal
        .newAccount(account_pwd)
        .then((address) => res.send(address));
});


app.get("/transfer", function (req, res) {
    var from = req.query.from;
    var to = req.query.to;
    var amount = req.query.amount;
    var pwd = req.query.pwd;

    if (web3.utils.isAddress(from) && web3.utils.isAddress(to)) {

        if (pwd != "") {
            web3.eth.personal.unlockAccount(from, pwd, 200).then(console.log('unlocked'));
        }

        var message = {from: from, to:to, value:web3.utils.toWei(amount, 'ether')};

        web3.eth.sendTransaction(message, (err, result) => {
            var output='';
            if(!err){
                output+=result;
            }else{
                output="Error";
            }
            res.send(output);
        })
    }
});

app.listen(8081, function () {
    console.log("start @localhost:8081");
});
