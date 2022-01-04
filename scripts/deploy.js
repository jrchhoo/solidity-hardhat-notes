async function main() {
    const [deployer] = await ethers.getSigners();

    console.log("Deploying contracts with the account:", deployer.address);
    console.log("Account balance:", (await deployer.getBalance()).toString());

    const MntToken = await ethers.getContractFactory("MntToken");
    const token1 = await MntToken.deploy();

    // const BallotToken = await ethers.getContractFactory("Ballot");
    // const token2 = await BallotToken.deploy();

    console.log("MntToken address:", token1.address);
    
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
