import { HardhatUserConfig } from 'hardhat/config'
import '@nomicfoundation/hardhat-toolbox-viem'
import 'hardhat-abi-exporter'
import 'dotenv/config'

const config: HardhatUserConfig = {
  solidity: '0.8.19',
  abiExporter: {
    path: './abi',
    runOnCompile: true,
    clear: true,
    flat: true,
    only: [':Subscription$'],
  },
  networks: {
    sepolia: {
      url: process.env.RPC || '',
      accounts: [process.env.PRIVKEY || ''],
    },
  },
}

export default config
