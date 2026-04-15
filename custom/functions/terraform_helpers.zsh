# set terraform env vars and log level
function tf_log() {
    local log_level="DEBUG"
    local log_provider="DEBUG"
    local log_file="$(PWD)/terraform-$(date +%d-%b-%Y_%H%M).log"

    if [ $# -gt 0 ]; then
        case $1 in
            "TRACE" | "DEBUG" | "INFO" | "WARN" | "ERROR")
                log_level=$1
                ;;
            *)
                log_file="$(PWD)/$1"
                ;;
        esac
    fi

    if [ $# -gt 1 ]; then
        log_file="$(PWD)/$2"
    fi

    export TF_LOG_CORE="$log_level"
    export TF_LOG_PROVIDER="$log_level"
    export TF_LOG_PATH="$log_file"
    touch $log_file
    echo "Terraform log level set to $log_level. Log file: $log_file"
}

# Create a terrafrom state list file
function tfstatelist() {
    local tfstatelist="$(terraform workspace show)-$(date +%d-%b-%Y_%H%M).tfstate.list"

    if [ $# -gt 0 ]; then
        tfstatelist=$1
    fi
    echo "Listing terraform state resources in $tfstatelist"
    terraform state list > $tfstatelist
    if [ ! -f "$tfstatelist" ]; then
        echo "Error: Terraform state list $tfstatelist not created."
        exit 1
    fi
}

# Pull terraform state into a .tfstate file
function tfstatepull() {
    local tfstatefile="$(terraform workspace show)-$(date +%d-%b-%Y_%H%M).tfstate"

    if [ $# -gt 0 ]; then
        tfstatefile=$1
    fi
    echo "Pulling terraform state to $tfstatefile"
    terraform state pull > $tfstatefile
    if [ ! -f "$tfstatefile" ]; then
        echo "Error: Terraform state file $tfstatefile not created."
        exit 1
    fi
}

function tfshowdel(){
    #local tfplanfile="tfplan"
    local tfplanfile=$1
    #if [ $# -gt 0 ]; then
    #    tfstatefile=$1
    #fi
    if [ ! -f "$tfplanfile" ]; then
        echo "Error: Terraform plan file \'$tfplanfile\' does not exist."
        echo "You need to generate a local .tfplan file."
        exit 1
    fi
    planned_deleted_resources="$(terraform show -json $tfplanfile | jq -r '.resource_changes[] | select(.change.actions | contains(["delete"])) | .address'\n)"
    echo "Resources planned to be deleted:"
    echo "$planned_deleted_resources"
}
