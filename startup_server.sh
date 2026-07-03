#proxy_ip="47.147.134.202"
proxy_ip="47.147.157.16"

# Remote forwards bind on the RPi/proxy host. This requires
# GatewayPorts clientspecified in the RPi sshd_config for public/NAT access.
#sudo mount /dev/sda1 /media/
tmux new-session -d -s autossh1 'bash -l'
tmux send-keys -t autossh1 "autossh -M 20004 -R 0.0.0.0:2222:localhost:22 ollie@${proxy_ip}" ENTER

tmux new-session -d -s autossh2 'bash -l'
tmux send-keys -t autossh2 "autossh -M 20002 -R 0.0.0.0:8888:localhost:8888 ollie@${proxy_ip}" ENTER

tmux new-session -d -s autossh3 'bash -l'
tmux send-keys -t autossh3 "autossh -M 20007 -R 0.0.0.0:3307:localhost:3306 ollie@${proxy_ip}" ENTER

tmux new-session -d -s autossh4 'bash -l'
tmux send-keys -t autossh4 "autossh -M 20008 -R 0.0.0.0:51006:localhost:51005 ollie@${proxy_ip}" ENTER

tmux new-session -d -s autossh5 'bash -l'
tmux send-keys -t autossh5 "autossh -M 20009 -R 0.0.0.0:32401:localhost:8096 ollie@${proxy_ip}" ENTER

tmux new-session -d -s autossh6 'bash -l'
tmux send-keys -t autossh6 "autossh -M 20010 -R 0.0.0.0:6006:localhost:6006 ollie@${proxy_ip}" ENTER

tmux new-session -d -s autossh9 'bash -l'
tmux send-keys -t autossh9 "autossh -M 20011 -R 0.0.0.0:8889:localhost:8889 ollie@${proxy_ip}" ENTER

# from https://gist.github.com/proudlygeek/5721498
tmux new-session -d -s autossh8 'bash -l'
tmux send-keys -t autossh8 "autossh -M 20012 -L 3049:localhost:2049 ollie@${proxy_ip}" ENTER

tmux new-session -d -s autossh10 'bash -l'
tmux send-keys -t autossh10 "autossh -M 20013 -R 0.0.0.0:8890:localhost:8890 ollie@${proxy_ip}" ENTER
#ssh -L 3049:localhost:2049 ollie@
#sudo mount -t nfs -o port=3049 localhost:/media/ollie/ff9e1ec0-72b7-4574-b12d-66f4a792d1fb/nfs /mnt/nfs-share

 
