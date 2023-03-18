proxy_ip="47.147.134.202"

sudo mount /dev/sda1 /media/
tmux new-session -d -s autossh1 'bash -l'
tmux send-keys -t autossh1 "autossh  -M 20004 -R ${proxy_ip}:2222:localhost:22 pi@${proxy_ip}" ENTER

tmux new-session -d -s autossh2 'bash -l'
tmux send-keys -t autossh2 "autossh -M 20002 -R ${proxy_ip}:8888:localhost:8888 pi@${proxy_ip}" ENTER

tmux new-session -d -s autossh3 'bash -l'
tmux send-keys -t autossh3 "autossh -M 20007 -R ${proxy_ip}:3307:localhost:3306 pi@${proxy_ip}" ENTER

tmux new-session -d -s autossh4 'bash -l'
tmux send-keys -t autossh4 "autossh -M 20008 -R ${proxy_ip}:51006:localhost:51005 pi@${proxy_ip}" ENTER

tmux new-session -d -s autossh5 'bash -l'
tmux send-keys -t autossh5 "autossh -M 20009 -R ${proxy_ip}:32401:localhost:8096 pi@${proxy_ip}" ENTER

tmux new-session -d -s autossh6 'bash -l'
tmux send-keys -t autossh6 "autossh -M 20010 -R ${proxy_ip}:6006:localhost:6006 pi@${proxy_ip}" ENTER

tmux new-session -d -s autossh9 'bash -l'
tmux send-keys -t autossh9 "autossh -M 20011 -R ${proxy_ip}:8889:localhost:8889 pi@${proxy_ip}" ENTER

# from https://gist.github.com/proudlygeek/5721498
tmux new-session -d -s autossh8 'bash -l'
tmux send-keys -t autossh8 "autossh -M 20012 -L 3049:localhost:2049 pi@${proxy_ip}" ENTER

tmux new-session -d -s autossh10 'bash -l'
tmux send-keys -t autossh10 "autossh -M 20012 -R ${proxy_ip}:8890:localhost:8890 pi@${proxy_ip}" ENTER
#ssh -L 3049:localhost:2049 pi@
#sudo mount -t nfs -o port=3049 localhost:/media/pi/ff9e1ec0-72b7-4574-b12d-66f4a792d1fb/nfs /mnt/nfs-share

 
