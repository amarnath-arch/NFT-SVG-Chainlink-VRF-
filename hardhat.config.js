/**
 * @type import('hardhat/config').HardhatUserConfig
 */
require('@nomiclabs/hardhat-waffle');
require('hardhat-deploy');
require("@nomiclabs/hardhat-etherscan");
require('dotenv').config();

const rinkeby_RPC_URL= process.env.RINKEBY_RPC_URL;
const MNEMONIC= process.env.MNEMONIC;
const Etherscan_API= process.env.Etherscan_API;

module.exports = {
  defaultNetwork: "hardhat",
  networks:{
    hardhat:{ },
    rinkeby:{
      url: rinkeby_RPC_URL,
      accounts:{
          mnemonic: MNEMONIC
      },
      saveDeployments: true
    }
  },
  etherscan:{
    apiKey: Etherscan_API 
  },
  solidity: {
    compilers: [
        {
            version: "0.8.4",
        },
        {
            version: "0.7.0",
        },
        {
            version: "0.6.6",
        },
        {
            version: "0.4.24",
        },
    ],
},
  namedAccounts:{
    deployer: {
      default: 0
    }
  }
};
