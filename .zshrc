alias la="ls -la"
alias ..="cd .."
alias python="python3"
alias pip="pip3"

function compile {
	cmake -S $1 -B $2 -G Ninja --fresh
	ninja -C $2
}

function debug {
	cmake -S $1 -B $2 -DCMAKE_BUILD_TYPE=Debug --fresh
	cmake --build $2
}

function cmemcheck {
	leaks -atExit -- ./$1
}

function cmarp {
	local with_w=false

	# Parse options
	zparseopts -D -E w=with_w_opt

	# Check if -w was passed
	if [[ -n $with_w_opt ]]; then
		marp --theme ../dracula.css --watch  $1.md -o $1.pdf -d --html --debug=true --engine engine.js --allow-local-files
	else
		marp --theme ../dracula.css  $1.md -o $1.pdf -d --html --debug=true --engine engine.js --allow-local-files
	fi

}

export PATH=$PATH:/Users/heart-of-gold/Library/Python/3.9/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
