// Async programming

const ethers = require("ethers")
const fs = require("fs-extra")
require("dotenv").config()

async function main() {
    // compile themin our code

    const provider = new ethers.JsonRpcProvider(process.env.RPC_URL)
    // method 1 : using env variables
    // const wallet = new ethers.Wallet(process.env.PRIVATE_KEY, provider);

    // methods 2 : using encrypted json key with passowrd

    const encryptJson = fs.readFileSync("./.encryptKey.json", "utf-8")
    let wallet = new ethers.Wallet.fromEncryptedJsonSync(
        encryptJson,
        process.env.PRIVATE_KEY_PASSWORD,
    )
    const abi = fs.readFileSync(
        "./SimpleStorage_sol_SimpleStorage.abi",
        "utf-8",
    )

    const binary = fs.readFileSync(
        "./SimpleStorage_sol_SimpleStorage.bin",
        "utf-8",
    )

    const contractFactory = new ethers.ContractFactory(abi, binary, wallet)
    console.log("Deploying, Wait...")

    // returns contract object
    const contract = await ethers.ContractFactory.deploy({
        // gasPrice: 100000000,
        // gasLimit: 100000000000,
    })
    // checking deployment
    console.log(contract)

    // checking deployment reciept (wait 1 block confirmation)
    const transactionReceipt = await contract.deployTransaction.wait(1)

    // console.log("The deployment transaction : ");
    // console.log(contract.deployTransaction);

    // console.log("The transaction receipt: ");
    // console.log(transactionReceipt);

    // Get the Number

    const currFavNum = await contract.retrieve()
    console.log(`Curr Fav Number : ${currFavNum.toString()}`)

    const trasRsp = await contract.store("7")
    const transRcpt = await trasRsp.wait(1)

    const updFavNum = await contract.retrieve()
    console.log(`Update Fav Number : ${updFavNum.toString()}`)
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.log(error)
        process.exit(1)
    })
