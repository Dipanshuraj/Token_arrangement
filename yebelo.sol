// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract Storage {


    uint256[5] slabs;
    mapping (address => string[]) map;
   
    function Deposite (uint256 noOfTokens) public returns (string memory) {
        if(Totalsupply() + noOfTokens <= 1500 && noOfTokens > 0){
            uint256 tokenLeft=noOfTokens;
            

             if((500-slabs[4])>0){
                 if((500-slabs[4])>=tokenLeft){
                     slabs[4]+=tokenLeft;
                     tokenLeft=0;

                     map[msg.sender].push("SLAB 5");
                 }else{
                     tokenLeft-=(500-slabs[4]);
                     slabs[4]=500;
                     map[msg.sender].push("SLAB 5");

                 }
                 
             }
                          if((400-slabs[3])>0 && tokenLeft>0){
                 if((400-slabs[3])>=tokenLeft){
                     slabs[3]+=tokenLeft;
                     tokenLeft=0;
                     map[msg.sender].push("SLAB 4");
                 }else{
                     tokenLeft-=(400-slabs[3]);
                     slabs[3]=400;
                     map[msg.sender].push("SLAB 4");

                 }
                 
             }
                          if((300-slabs[2])>0 && tokenLeft>0){
                 if((300-slabs[2])>=tokenLeft){
                     slabs[2]+=tokenLeft;
                     tokenLeft=0;
                     map[msg.sender].push("SLAB 3");
                 }else{
                     tokenLeft-=(300-slabs[2]);
                     slabs[2]=300;
                     map[msg.sender].push("SLAB 3");

                 }
                 
             }
                                       if((200-slabs[1])>0 && tokenLeft>0){
                 if((200-slabs[1])>=tokenLeft){
                     slabs[1]+=tokenLeft;
                     tokenLeft=0;
                     map[msg.sender].push("SLAB 2");
                 }else{
                     tokenLeft-=(200-slabs[1]);
                     slabs[1]=200;
                     map[msg.sender].push("SLAB 2");

                 }
                 
             }
                                       if((100-slabs[0])>0 && tokenLeft>0){
                 if((100-slabs[0])>=tokenLeft){
                     slabs[0]+=tokenLeft;
                     tokenLeft=0;
                     map[msg.sender].push("SLAB 1");
                 }else{
                     tokenLeft-=(100-slabs[0]);
                     slabs[0]=100;
                     map[msg.sender].push("SLAB 1");

                 }
                 
             }


        } else {
            if(noOfTokens==0){
                return "0 token can't be deposited";
            }
            return "No storage left for new tokens";
        }

     return "Your amount is Deposited";  // number = num;
    }

   function Totalsupply() public view returns (uint256){

       return slabs[0]+slabs[1]+slabs[2]+slabs[3]+slabs[4];
   }

    function EnquireYourTokenSlab(address WalletAddress) public view returns (string[] memory){

        return map[WalletAddress];
    }
}