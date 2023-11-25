import hre from 'hardhat'

async function main() {
  const subscription = await hre.viem.deployContract('Subscription', [])

  console.log(`Subscription was deployed to ${subscription.address}`)
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error)
  process.exitCode = 1
})
