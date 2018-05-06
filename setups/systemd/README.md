Install a systemd service for the renderer (daemon).
Install it using:
<pre>
sudo ./install
</pre>

You can check if the daemon is running after that using:
<pre>
systemctl status electricsheep-hd-client.service
</pre>

Make sure that the user you are using sudo with is also the owner of the client.