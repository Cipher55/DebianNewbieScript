# Debian Newbie Script

##REREAD THIS AS IT HAS CHANGED... YET AGAIN


This is a script designed for the users of 4Chan's daily Friendly Linux Thread (https://boards.4chan.org/g/flt)
This script is designed to slightly rice a new Debian install, add some privacy features, add some good GNU/Linux programs, remove all desktop enviorments, and add a light-weight one called LXDE. LXDE looks like the classic Windows' interface, so it is better for newbies who are most likley switching to GNU/Linux from Windows.

##How to install!
Get the script from this link (https://raw.githubusercontent.com/Chocolate-Chip-Computing/DebianNewbieScript/master/newbie.sh) 

You should be able to wget it. Try going to your folder of choice (I reccomend the desktop), and do

<code>wget --no-check-certificate https://raw.githubusercontent.com/Chocolate-Chip-Computing/DebianNewbieScript/master/newbie.sh</code>


If wget isn't installed (which it should be) then you should be able to just download it though a pre-installed web browser on your DE. If neither of these options work, then you are screwed.

**you must run it in a virtual console by pressing <code>ctrl</code> + <code>alt</code> + <code>F2</code>.** You can also do <code>F1</code> through <code>F6</code>. You need to do this as the DEs are being moved around and what not, you will lose the output. At the end there is stuff you need to see. When in the virtual terminal, Login as yourself.

Go to the folder by opening up the virtual terminal, then change to the directory the script is in. For example,

<code>cd ~/Desktop</code>

then run the script as

<code>su -m -p -c ./newbie.sh</code>

(YOU MUST RUN THE SCRIPT WITH THESE VARIABLES!)

I have been told that for some terminals, an error returns with "no password entry for ./newbie.sh". I don't understand why. I don't get this error myself. If this happens, do 

<code>su -m -p</code>

then do <code>/.newbie.sh</code>. Just  **MAKE SURE TO USE THE ARGS <code>-m</code> <code>-p</code>! IT HAS TO HAVE THESE ARGS OR ELSE A NUMBER OF VARIBLES WILL BE READ AS ROOT AND NOT YOUR OWN USER!**

Enter the root password you chose at the time of install.

If you recieve any errors, such as "Permission Denied", preform 

<code>su</code>

then preform
<code>chmod 777 newbie.sh</code>

then exit, and run the script. If you run the script in the current terminal, it will fail. It must be run with the arguments as listed above.

This will change the permissions and you should be able to run it

###After installing
Reboot your computer. It's that simple. This script will create a few new folders with instructions. You can easily delete these folders after you are done with them.

####Bug Reports
All bug reports can be sent to my private email address, 
[chocolatechip@derpymail.org] (mailto:ChocolateChip@derpymail.org?subject=Debian%20Newbie%20Script%20Bugs)

A PGP Key can be found [here] (https://choco.neocities.org/pgp) (though, if you are a n00b, you probably don't know what PGP is...)

I can also be contacted via IRC: (irc://irc.canternet.org:+6697/Chocolate_Chip)


