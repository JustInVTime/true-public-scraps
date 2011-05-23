#!/bin/bash
git status
if [ -z "${1}" ]; then
	PREV_COMMENT=""
	if [ -f ~/.gitup.dat ]; then
		PREV_COMMENT=$(cat ~/.gitup.dat)
	fi
	if [ -f .gitup.dat ]; then
		PREV_COMMENT=$(cat .gitup.dat)
	fi

	if [ ! -f .gitignore ] || [ $(cat .gitignore |grep '.gitup.dat' |wc -l) -eq 0 ]; then
		echo '.gitup.dat' >> .gitignore
		git add .gitignore
		git add ${0}
	fi

	echo "You are about to commit & gitup changes"
	echo "Press CTRL+C now if you are unsure"
	echo ""

	while [ -z "${COMMENT}" ]; do
		read -p "Please tell me what you've done: (default is: '${PREV_COMMENT}') " COMMENT
		[ -z "${COMMENT}" ] && [ -n "${PREV_COMMENT}" ] && COMMENT="${PREV_COMMENT}"
	done
else
	if [ -n "${21}" ]; then
		echo "20 Words Max"
		exit 1
	fi
	COMMENT="${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${13} ${14} ${15} ${16} ${17} ${18} ${19} ${20}"
fi
echo "${COMMENT}" > .gitup.dat
echo "${COMMENT}" > ~/.gitup.dat

echo "Committing: ${COMMENT}..."
git commit -a -m "${COMMENT}" && git push origin master
