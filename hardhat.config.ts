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
      url: "https://polygon-mainnet.infura.io/v3/5cc253a660514294828f6a2b134ce02b",
      
    }
  },
  etherscan: {
    apiKey: {
      polygon: "XYQJFJ7VMQWAZ95UVGVKPXUHGEQUQVFQNS"
    }
  },
};

export default config;
