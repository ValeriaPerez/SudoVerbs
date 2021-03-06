if [ -f ~/.vocab ]; then
    rm ~/.vocab
fi

if [ -f ~/.vocabscript ]; then
    rm ~/.vocabscript
fi

wget -O ~/.vocab "https://raw.githubusercontent.com/ricardo-pcan/SudoVerbs/master/.vocab" --no-check-certificate
wget -O ~/.vocabscript "https://raw.githubusercontent.com/ricardo-pcan/SudoVerbs/master/.vocabscript" --no-check-certificate

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	OSBASHRC=bashrc
elif [[ "$OSTYPE" == "darwin"* ]]; then
	OSBASHRC=bash_profile
fi

if ! grep -Fxq '~/.vocab' ~/.$OSBASHRC; then
	echo $'\nchmod +x ~/.vocab\n~/.vocab' >> ~/.$OSBASHRC
fi

OSBASHRC="zshrc"
if [[ -f ~/.$OSBASHRC ]]; then
	if ! grep -Fxq '~/.vocab' ~/.$OSBASHRC; then
		echo $'\nchmod +x ~/.vocab\n~/.vocab' >> ~/.$OSBASHRC
	fi
fi
