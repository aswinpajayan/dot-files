#!/bin/sh
icon="$HOME/.config/awesome/data/lockIcon.png"
bg="$HOME/Pictures/ocean1.jpg"
tmpicon='/tmp/icon.png'
tmpbg='/tmp/bg.png'

# take a screenshot
#gnome-screenshot -f "$tmpbg"

convert $icon -resize 140x140 $tmpicon
convert $bg -geometry 1366x $tmpbg
# blur the screenshot by resizing and scaling back up
convert "$tmpbg" -filter Gaussian -blur 0x8 "$tmpbg"

# overlay the icon onto the screenshot
convert "$tmpbg" "$tmpicon" -gravity center -composite "$tmpbg"


B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#ff00ffcc'  # default
T='#ffffffff'  # text
W='#ff0000bb'  # wrong
V='#e6e600bb'  # verifying
R='#eb606baa'  #RED

~/i3lock-color/x86_64-pc-linux-gnu/i3lock \
--insidevercolor=$V   \
--ringvercolor=$B     \
--radius=65             \
\
--time-font="Abril Fatface" \
--date-font="Abril Fatface" \
--timesize=52 \
--insidewrongcolor=$W \
--ringwrongcolor=$B   \
--wrongtext=""   \
--veriftext=""   \
\
--insidecolor=$B      \
--ringcolor=$B        \
--linecolor=$B        \
--separatorcolor=$B   \
\
--verifcolor=$V        \
--wrongcolor=$W        \
--timecolor=$T        \
--datecolor=$T        \
--layoutcolor=$T      \
--keyhlcolor=$B       \
--bshlcolor=$W        \
\
--screen 1            \
--image=$tmpbg            \
--clock               \
--timestr="%H:%M"  \
--datestr="%A, %m %Y" \
--timepos="690:550" \

# --veriftext="Drinking verification can..."
# --wrongtext="Nope!"
# --textsize=20
# --modsize=10
# --timefont=comic-sans
# --datefont=monofur
# etc
