//There are many ways for this to fail (this.is.an.ip, for example) that it doesn't catch.  Be gentle.
function aton( a )
{
        var base = 0;
        var i = 0;
        var mult = 256 * 256 * 256;
        var n = 0;

        for ( i=0; i < a.length; i++ )
        {
                if ( a.charAt(i) == '.' )
                {
                        if ( i - base <= 0 )
                        {
                                alert( "Failed to convert '" + a + "' to a useable IP address." );
                                return -1;  //Here's hoping you have some smarts; otherwise, this'll put in 255.255.255.255.
                        }

//                      alert( "Converting section '" + a.substring(base,i) + "' to " + (mult * a.substring(base,i)) + "." );
                        n += mult * (a.substring(base,i)*1);
                        mult /= 256;

                        if ( mult < 1 )
                        {
                                alert( "Failed to convert '" + a + "' to a useable IP address (stop dots)." );
                                return -1;
                        }

                        base = i+1; //+1 = skip the "."
//                      alert( n );
                }
        }

        n += (a.substring(base,a.length)*1); //Explicitly not multiplied by "mult"; see inet_aton(3).  "* 1" = "cast to int".

//      alert(n);
        return n;
}
