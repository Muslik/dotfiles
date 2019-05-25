if tmux info &> /dev/null; then
	echo
else
	read -p "Activate TMUX? " -n 1 -r
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		tmux
	fi
fi
