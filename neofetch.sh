hostn="$(hostname -s)"
user="$(id -un)"
os="$(sw_vers -productName) $(sw_vers -productVersion)"
kernel="$(uname -omr)"
uptime="$(uptime | awk -F, '{sub(".*up ",x,$1);print $1}' | sed -e 's/^[ \t]*//')"
shell="zsh"
mem="$(vm_stat | awk '/free/ {print $3}' | sed 's/\.//')"
res="2560x1600"

typeset -a yoda_quotes
yoda_quotes=(
    'No! Try not. Do. Or do not. There is no try.'
    'Fear is the path to the dark side. Fear leads to anger. Anger leads to hate. Hate leads to suffering.'
    'Patience you must have, my young Padawan.'
    'You must unlearn what you have learned.'
    'Pass on what you have learned. Strength, mastery, hmm… but weakness, folly, failure, also. Yes, failure, most of all. The greatest teacher, failure is.'
    'Train yourself to let go of everything you fear to lose.'
    'In a dark place we find ourselves, and a little more knowledge lights our way.'
    'Many of the truths that we cling to depend on our point of view.'
    'If no mistake have you made, yet losing you are, a different game you should play.'
    'Named must your fear be before banish it you can.'
    'Yes, I am afraid. Hmm, surprised are you? A challenge lifelong it is, not to bend fear into anger.'
    'No longer certain, that one ever does win a war, I am. For in fighting the battles, the bloodshed, already lost we have.'
    'Smaller in number are we, but larger in mind.'
    'To be Jedi is to face the truth, and choose. Give off light, or darkness, Padawan. Be a candle, or the night.'
    'We are what they grow beyond. That is the true burden of all masters.'
)
cowsay -f ~/Git/cowsay-files/cows/true-color/yoda2.cow ${yoda_quotes[$RANDOM % ${#yoda_quotes[@]}]}

# echo "[?25l[?7l[0m[32m[1m                    'c."
# echo "                 ,xNMM."
# echo "               .OMMMMo"
# echo "               OMMM0,"
# echo "     .;loddo:' loolloddol;."
# echo "   cKMMMMMMMMMMNWMMMMMMMMMM0:"
# echo "[0m[33m[1m .KMMMMMMMMMMMMMMMMMMMMMMMWd."
# echo " XMMMMMMMMMMMMMMMMMMMMMMMX."
# echo "[0m[31m[1m;MMMMMMMMMMMMMMMMMMMMMMMM:"
# echo ":MMMMMMMMMMMMMMMMMMMMMMMM:"
# echo "[0m[31m[1m.MMMMMMMMMMMMMMMMMMMMMMMMX."
# echo " kMMMMMMMMMMMMMMMMMMMMMMMMWd."
# echo " [0m[35m[1m.XMMMMMMMMMMMMMMMMMMMMMMMMMMk"
# echo "  .XMMMMMMMMMMMMMMMMMMMMMMMMK."
# echo "    [0m[34m[1mkMMMMMMMMMMMMMMMMMMMMMMd"
# echo "     ;KMMMMMMMWXXWMMMMMMMk."
# echo "       .cooc,.    .,coo:.[0m"
echo "[17A[9999999D[42C[0m[1m[32m[1m${user}[0m@[32m[1m${hostn}[0m "
echo "[42C[0m----------------------------------[0m "
echo "[42C[0m[33m[1mOS[0m[0m:[0m ${os}[0m "
echo "[42C[0m[33m[1mKernel[0m[0m:[0m ${kernel}[0m "
echo "[42C[0m[33m[1mPackage Manager[0m[0m:[0m homebrew[0m "
echo "[42C[0m[33m[1mShell[0m[0m:[0m ${shell}[0m "
echo "[42C[0m[33m[1mResolution[0m[0m:[0m ${res}[0m "
echo "[42C[0m[33m[1mDE[0m[0m:[0m Aqua[0m "
echo "[42C[0m[33m[1mWM[0m[0m:[0m Quartz Compositor[0m "
echo "[42C[0m[33m[1mTerminal[0m[0m:[0m wezterm[0m "
echo "[42C[0m[33m[1mTerminal Font[0m[0m:[0m JetBrains Mono[0m "
echo "[42C[0m[33m[1mCPU[0m[0m:[0m Apple M2[0m "
echo "[42C[0m[33m[1mGPU[0m[0m:[0m Apple M2[0m "
echo "[42C[0m[33m[1mMemory[0m[0m:[0m 32768MiB[0m "
echo ""
echo "[42C[30m[40m   [31m[41m   [32m[42m   [33m[43m   [34m[44m   [35m[45m   [36m[46m   [37m[47m   [m"
echo "[42C[38;5;8m[48;5;8m   [38;5;9m[48;5;9m   [38;5;10m[48;5;10m   [38;5;11m[48;5;11m   [38;5;12m[48;5;12m   [38;5;13m[48;5;13m   [38;5;14m[48;5;14m   [38;5;15m[48;5;15m   [m"
echo ""
echo ""
echo "[?25h[?7h"
