import CryptoPoops from 0x01
import NonFungibleToken from 0x03

transaction (recp:Address){

  prepare(acct: AuthAccount) {

  let nft= acct.borrow<&CryptoPoops.NFTMinter>(from: /storage/Minter)!
  let ref=getAccount(recp).getCapability(/public/Collection)
           .borrow<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>()
           ??panic("No collection present ")

  ref.deposit(token: <-nft.createNFT(name: "Saichandhu", favouriteFood: "milk", luckyNumber:54))
 
    }

  execute {
 log("new token deposited")
}
}