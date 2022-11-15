pragma solidity ^0.8.7;
contract addition
{
    uint a;
    uint b;
    function set_a(uint x)public
    {
        a=x;

    }
    function set_b(uint y)public
    {
        b=y;
    }
    function add()public view returns(uint)
    {
        return a+b;
    }
}
