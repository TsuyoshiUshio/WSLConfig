#!/bin/bash

# Install Azure CLI 

bash ./install_azurecli.sh

# This is interfactive mode
az login 

bash ./install_node.sh

bash ./install_aks.sh

bash ./install-dotnet.sh

bash ./install-azure-functions-core-tools.sh

bash ./custom_config.sh





