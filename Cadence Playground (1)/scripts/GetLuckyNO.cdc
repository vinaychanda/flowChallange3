import CryptoPoops from 0x01
import NonFungibleToken from 0x03

pub fun main(acc:Address,_id:UInt64):Int{
 let reff= getAccount(acc).getCapability(/public/Collection)
           .borrow<&CryptoPoops.Collection{CryptoPoops.MyCollectionPublic}>()
           ??panic("this acc has no collection")


return reff.borrowAuthNFT(id: _id).luckyNumber
}