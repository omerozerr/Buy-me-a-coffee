const hre = require("hardhat");

async function main() {
    // We get the contract to deploy.
    const BuyMeCoffee = await hre.ethers.getContractFactory("BuyMeCoffee");
    const buyMeCoffee = await BuyMeCoffee.deploy();

    await buyMeCoffee.deployed();

    console.log("BuyMeCoffee deployed to:", buyMeCoffee.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
