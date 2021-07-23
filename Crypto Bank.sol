// Name: Hafiz Sayyed Ali Hamdani
//Roll No: PIAIC68636
// BCC Assignment 2
 pragma solidity ^0.8.0;
contract Bank{
   address  private  OwnerAddress=tx.origin;
   uint private Initial_balance;
   address[] private addresses;
   uint[] private balances;
// Step 1: The owner can start the bank with initial deposit/capital in ether (min 50 eths)
   modifier onlyOwner {
    require(tx.origin == OwnerAddress && msg.value>=(50 ether));
    _;
}
   function Start_Bank() external payable onlyOwner() returns (string memory,uint){
       Initial_balance=msg.value;
       return ("Your Bank has been Started. Your current ballence is",Initial_balance);
   }
// Step 2: Only the owner can close the bank. Upon closing the balance should return to the Owner 
   modifier onlyOwner2{
       require(tx.origin==OwnerAddress);
       _;
   }
   
   function Close_Bank()public onlyOwner2(){
       selfdestruct(payable(OwnerAddress));
   }
//  Step 3 & 4:  (3) Anyone can open an account in the bank for Account opening they need to deposit ether with address
    //           (4) Bank will maintain balances of accounts
modifier account_holder{
    require(msg.value>=(1 ether) && tx.origin!=OwnerAddress && address(this).balance>=(50 ether));
    _;
}
function Open_Account() public payable account_holder() returns(uint){
    addresses.push(tx.origin);
    balances.push(msg.value);
    return msg.value;
}
// Step 5: Anyone can deposit in the bank
modifier Check {
    require(Initial_balance>(45 ether));
    _;
}
function Deposit(address _accont_address) public payable Check() returns(string memory ,uint){
   for(uint i=0;i<addresses.length;i++){
       if(addresses[i]==_accont_address){
              balances[i]=balances[i]+msg.value;
// Account total balance is balances[i]
           return ("You have Deposited the",msg.value) ;
       }
   }
  }
// Step 6:Only valid account holders can withdraw{
modifier check2{
    for(uint i=0;i<addresses.length;i++){
        if(addresses[i]==tx.origin){
            _;
        }
    }
}
function withdraw_in_wei(uint value) public payable check2(){
    for(uint i=0;i<addresses.length;i++){
        if(addresses[i]==tx.origin){
            balances[i]=balances[i]-value;
            payable(tx.origin).transfer(value);
        }
    }
   }
// Step 7:First 5 accounts will get a bonus of 1 ether in bonus
 function Bonus() external payable onlyOwner2 returns(uint,uint,uint,uint,uint,uint){
     for(uint i=0;i<5;i++){
         balances[i]=balances[i]+(1 ether);
     }
     Initial_balance=Initial_balance-(5 ether);
     return (Initial_balance,balances[0],balances[1],balances[2],balances[3],balances[4]);
 }
// Step8: Account holder can inquiry balance
function balance_Inquary() public payable check2() returns(uint){
    for(uint i=0;i<addresses.length;i++){
        if(addresses[i]==tx.origin){
            return balances[i];
        }
    }
   }
// Step9:The depositor can request for closing an account
function close_Account() public payable check2() returns(string memory,uint){
    for(uint i=0;i<addresses.length;i++){
        if(addresses[i]==tx.origin){
            payable(tx.origin).transfer(balances[i]);
            delete addresses[i];
            delete balances[i];
        return ("Your balance is",balances[i]);
        }
    }
   }
}
// Name: Hafiz Sayyed Ali Hamdani
//Roll No: PIAIC68636
// BCC Assignment 2