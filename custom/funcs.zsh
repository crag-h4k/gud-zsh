# Functions ##############################
function bak() { 
    original=$1
    tar cJf .bak.$(date +%d-%b-%Y).$original.tar.xz $original
    }
#
function tinit() { 
    dst=$1; 
    ls $dst;
    echo "" > $dst/__init__.py;
    }
#
function mkvenv() {
    dst=$1; 
    options=$2
    python3 -m venv $dst $options;
    }
#
# make a dir and cd into it
function mcd() { 
    dir_name=$1;
    mkdir -p $dir_name;
    cd $dir_name;
    }
#
function notes() { 
    name=$1;
    notes_dir=$HOME/notes;
    mkdir -p $notes_dir;
    vim $notes_dir/$name-$(date +%d-%b-%Y).md;
    }
function pubip(){
    public_ip=$(curl http://icanhazip.com);
    echo $public_ip;
    echo $(geoiplookup $public_ip);
}
