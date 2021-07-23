// Name: Hafiz Sayyed Ali Hamdani
//Roll No: PIAIC68636
// BCC Assignment 1
pragma solidity ^0.8.6;
// Step 1
contract Parentvehicle{
    function start() public pure returns(string memory){
        return "The Vehicle has just Started";
    }
    function accelerate() public pure returns(string memory){
        return "The Vehicle has just Accelerated";
    }
    function stop() public pure returns(string memory){
        return "The Vehicle has just Stopped";
    }
    function service() virtual public view returns(string memory){
        return "The Vehicle is being serviced";
    }
}
contract Car is Parentvehicle{
    function service() override public view returns(string memory){
        return "The Car is being serviced";
    }
}
contract Truck is Parentvehicle{
    function service() override public view returns(string memory){
        return "The Truck is being serviced";
    }
}
contract Motor_cycle is Parentvehicle{
    function service() override public view returns(string memory){
        return "The Motor Cycle is being serviced";
    }
}
// Step 3 and 4 is started from here
contract AltoMehran is Car{
    function servicestation1() public view returns(string memory){
        AltoMehran a=AltoMehran(address(this));
        return a.service();
    }
    
}
contract Hino is Truck{
    function servicestation2() public view returns(string memory){
        Hino h=Hino(address(this));
        return h.service();
    }
    
}
contract Yamaha is Motor_cycle{
    function servicestation3() public view returns(string memory){
        Yamaha y=Yamaha(address(this));
        return y.service();
    }
    
}
// Name: Hafiz Sayyed Ali Hamdani
//Roll No: PIAIC68636
// BCC Assignment 1