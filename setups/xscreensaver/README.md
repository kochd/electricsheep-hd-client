Installs a xscreenserver compatible screenserver that executes 'play'

# How to install
<pre>
sudo ./install ~
</pre>
or
<pre>
sudo ./install /home/another_user/
</pre>

# What it does
It installs a 'eshd' script in /usr/lib/xscreensaver/eshd containing
<pre>
#!/bin/bash
/home/foo/electricsheep-hd-client/play
</pre>

And adds the script to the .xscreensaver config in the homedirectory of the user
<pre>
....
programs:								      \
				maze -root				    \n\
	   "Electric Sheep HD" 	eshd -root				    \n\
- GL: 				superquadrics -root			    \n\																				
....
</pre>

After that you can select it as a screensaver in xscreensaver.

If you want to replace your current screensaver with xscreensaver see
<pre>
man xscreensaver
</pre>

