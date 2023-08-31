sudo mount /dev/sda1 usbdrive/

tmux new-session -d -s socat1 'bash -l'
tmux send-keys -t socat1 "socat TCP-LISTEN:3306,fork TCP:localhost:3307" ENTER

tmux new-session -d -s socat2 'bash -l'
tmux send-keys -t socat2 "socat TCP-LISTEN:51005,fork TCP:localhost:51006" ENTER

tmux new-session -d -s socat3 'bash -l'
tmux send-keys -t socat3 "socat TCP-LISTEN:8893,fork TCP:localhost:32401" ENTER
