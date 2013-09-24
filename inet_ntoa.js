function ntoa( n )
{
        var myN = n;

        if ( myN < 0 ) //Try saving JavaScript from itself.  Yay crappy Javascript bitwise operators!
        {
                myN = ((myN>>>1)*2) + (myN&1);
        }
        
        if ( myN < 0 || myN > 256*256*256*256 )
        {
                alert( "Bad ntoa call with '" + myN + "'." );
                return false;
        }
        
        //The last Math.floor isn't strictly necessary, but it saves us from getting non-integers as inputs.
        return Math.floor(myN/256/256/256) + "." + Math.floor((myN/256/256)%256) + "." + Math.floor((myN/256)%256) + "." + Math.floor(myN%256);
}
