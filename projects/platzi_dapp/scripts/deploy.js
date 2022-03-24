
const hre = require("hardhat");

const deploy = async () => {
    const [deployer] = await hre.ethers.getSigners();
    console.log("Deploying contract with the account : ", deployer.address);

    const PlatziPunks = await hre.ethers.getContractFactory("PlatziPunks");
    const deployed = await PlatziPunks.deploy();

    console.log("Platzi Punks is deployed at :", deployed.address);
};

deploy().then(() => process.exit(0)).catch(error => {
    console.log(error);
    process.exit(1);
});