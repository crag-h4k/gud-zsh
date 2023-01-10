# this function adds a gif url with a date as the alt text
# to a gif_file located at $HOME/.gifs.md
function addgif() {
    url=$1;
    gif_file=$HOME/.gifs.md;
    echo !\[$(date +%d-%b-%Y)\]\($url\) >> $gif_file;
}
