# DogBox
Remote Prim Manipulation project for Second Life. 
A template for LSL web interfaces and anything to do with clicking a button on a website and making something happen in an LSL script. This will get you started, on both the LSL script and the website.

first time seeing this was from my friend:
https://github.com/felix-two-tone/indusys
lots of code copied from him

installation/setup:
set up a flask site on your linux vps with this video
https://youtu.be/KgAtZ1LlNiQ

git clone this repository when he starts talking about making a directory at 3:30 and skip to 5:50 when he starts talking about installing nginx
instead of flask_project just write remotePrimManipulation, including during the gunicorn launch
you can hit ctrl-c to stop the gunicorn process while it's running and close the website

port forward port 80 on your vps through 'ufw allow 80' or some other means if you don't see a website

once you have a website up and running with buttons you can press, go into SL and copy and paste the script from the lsl folder into a default prim with a blank texture
click to open the url it pastes in the chat when you save and run the script, copy the url without the %20 at the end, and you'll be pasting that
into the '\_\_init\_\_.py' script as one of the variables

once you 'nano \_\_init\_\_.py' and place the SLURL variable for url, just save it with ctrl-s, write it with ctrl-o, and close it with ctrl-x
then, run the gunicorn process on ur file again and u should have it up and running and fully functional
