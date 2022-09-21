import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: {
    compilers: [
      {
        version: "0.8.7",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200,
          },
        },
      },
    ],
  }, 
  defaultNetwork: "hardhat",
  networks: {
    hardhat: {
    },
    polygon: {
      url: "https://polygon-mainnet.infura.io/v3/${INFURA_API_KEY}",
    }
  },
  
  etherscan: {
    apiKey: {
      polygon: "${ETHERSCAN_API_KEY}",
    }
  },
};

export default config;
