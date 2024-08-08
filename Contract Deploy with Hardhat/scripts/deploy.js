// deploying the smart contract

const { ethers } = require("hardhat")
require("dotenv").config()

// aysnc main

async function main() {
    const SimpleStorageFactory =
        await ethers.getContractFactory("SimpleStorage")

    console.log("Deploying contract... ")
    const simpleStorage = await SimpleStorageFactory.deploy()

    // waiti
    await simpleStorage.deployed()
    console.log("Deployd")
    const output = await simpleStorage.getDeployedCode()
    console.log(
        `Address of Deployed Contract :  ${await simpleStorage.getAddress()}`,
    )
}

// main

main()
    .then(process.exit(0))
    .catch((error) => {
        console.log(error)
        process.exit(1)
    })
