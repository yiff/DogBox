vector COLOR_WHITE = <1.0, 1.0, 1.0>;
vector COLOR_RED = <1.000, 0.255, 0.212>;
vector COLOR_GREEN = <0.180, 0.800, 0.251>;
vector COLOR_BLUE = <0.000, 0.455, 0.851>;

key requestURL;
string url = "";

default
{
    state_entry()
    {
        llSetColor(COLOR_WHITE, ALL_SIDES);
        requestURL = llRequestURL();
    }

    http_request(key id, string method, string body)
     {
        if ((method == URL_REQUEST_GRANTED) && (id == requestURL) )
        {
            // An URL has been assigned to me.
            llOwnerSay("SLURL = \""+body+"\"");
            url = body;
            requestURL = NULL_KEY;
        }
        else if ((method == URL_REQUEST_DENIED) && (id == requestURL))
        {
            // I could not obtain a URL
            llOwnerSay("There was a problem, and an URL was not assigned: " + body);
            requestURL = NULL_KEY;
        }

        else if (method == "POST") // Remote commands from python script
        {
            if (body == "color=red")
            {
                llSetColor(COLOR_RED, ALL_SIDES);
                llOwnerSay("Prim turned Red remotely.");
                llHTTPResponse(id,200,"The prim has been turned Red in Second Life.");
            }

            if (body == "color=green")
            {
                llSetColor(COLOR_GREEN, ALL_SIDES);
                llOwnerSay("Prim turned Green remotely.");
                llHTTPResponse(id,200,"The prim has been turned Green in Second Life.");
            }

            if (body == "color=blue")
            {
                llSetColor(COLOR_BLUE, ALL_SIDES);
                llOwnerSay("Prim turned Blue remotely.");
                llHTTPResponse(id,200,"The prim has been turned Blue in Second Life.");
            }
        }

        else
        {
            llHTTPResponse(id,200,url);
        }
    }
}