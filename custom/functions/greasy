# plays a greasy video
# requires vlc to be installed

function greasy() {
    greasy_path="$ZSH_CUSTOM/functions/resources/greasy-bubbles.mp4"

    if command -v vlc &>/dev/null; then
        ( vlc --play-and-exit --no-embedded-video --no-video-deco "$greasy_path" &&
          vlc://quit ) &>/dev/null 2>&1;
        return $?
    elif command -v open &>/dev/null; then
        open "$greasy_path" &>/dev/null 2>&1;
        return $?
    else
        echo "VLC or a compatible command is required to play the video."
        return 1
    fi
}
