require("@nomiclabs/hardhat-waffle");
require('dotenv').config();

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
// task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
//   const accounts = await hre.ethers.getSigners();

//   for (const account of accounts) {
//     console.log(account.address);
//   }
// });

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */


const server = process.env.SERVER_GANACHE;

module.exports = {
  solidity: "0.8.4",
  networks:{
    ganache: {
      url:`${server}`,
    } 
    // rinkebase:{
    //   url: 'https://rinkeby.infura.io/v3/811f065cce06419690ab23bd89651db3',
    //   accounts: [

    //   ]
    // }
  }
};
