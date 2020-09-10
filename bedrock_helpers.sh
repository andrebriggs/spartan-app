# Obtain OS to download the appropriate version of Bedrock CLI
function get_os_bedrock() {
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        eval "$1='linux'"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        eval "$1='macos'"
    elif [[ "$OSTYPE" == "msys" ]]; then
        eval "$1='win.exe'"
    else
        eval "$1='linux'"
    fi
}

# Download Bedrock CLI
function download_bedrock() {
    echo "DOWNLOADING BEDROCK CLI"
    echo "Latest CLI Version: $CLI_VERSION_TO_DOWNLOAD"
    os=''
    get_os_bedrock os
    bedrock_cli_wget=$(wget -SO- "https://github.com/microsoft/bedrock-cli/releases/download/$CLI_VERSION_TO_DOWNLOAD/bedrock-$os" 2>&1 | grep -E -i "302")
    if [[ $bedrock_cli_wget == *"302 Found"* ]]; then
    echo "Bedrock CLI $CLI_VERSION_TO_DOWNLOAD downloaded successfully."
    else
        echo "There was an error when downloading Bedrock CLI. Please check version number and try again."
    fi
    wget "https://github.com/microsoft/bedrock-cli/releases/download/$CLI_VERSION_TO_DOWNLOAD/bedrock-$os"
    mkdir bedrock
    mv bedrock-$os bedrock/bedrock
    chmod +x bedrock/bedrock 

    export PATH=$PATH:$HOME/bedrock
}