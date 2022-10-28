tmux new-session -d -s autossh1 'bash -l'
tmux send-keys -t autossh1 "autossh  -M 20004 -R 47.147.134.169:2222:localhost:22 pi@47.147.134.169" ENTER

tmux new-session -d -s autossh2 'bash -l'
tmux send-keys -t autossh2 "autossh -M 20002 -R 47.147.134.169:8888:localhost:8888 pi@47.147.134.169" ENTER

tmux new-session -d -s autossh3 'bash -l'
tmux send-keys -t autossh3 "autossh -M 20007 -R 47.147.134.169:3307:localhost:3306 pi@47.147.134.169" ENTER

tmux new-session -d -s autossh4 'bash -l'
tmux send-keys -t autossh4 "autossh -M 20008 -R 47.147.134.169:51006:localhost:51005 pi@47.147.134.169" ENTER

tmux new-session -d -s autossh5 'bash -l'
tmux send-keys -t autossh5 "autossh -M 20009 -R 47.147.134.169:32401:localhost:8096 pi@47.147.134.169" ENTER
