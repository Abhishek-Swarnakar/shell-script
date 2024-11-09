if [$# -ne 2]; then
    echo "USAGE: $0 <region> <service_name>"
    exit 1
fi


if ! command -v aws &> /dev/null; then
    echo "AWS CLI not found. Installing it now..."

    sudo apt update
    sudo apt install unzip
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install

    if command -v aws &> /dev/null; then
        echo "AWS CLI installed successfully."
        aws --version
    else
        echo "Failed to install AWS CLI."
    fi
else
    echo "AWS CLI is already installed."
    aws --version
fi

if [! -d ~/ .aws ]; then
    echo "AWS CLI is not configured...Configuring now!!"
    aws configure
else
    echo "AWS CLI is configured already!!"
fi