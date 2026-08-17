#!/bin/bash

set -e

SUBSCRIPTION_ID="********************"
RESOURCE_GROUP="rg-migration"
VM_NAME="migrated-vm-01"
LOCATION="eastus"
IMAGE="UbuntuLTS"
SIZE="Standard_B2s"
ADMIN_USERNAME="azureuser"

echo "======================================"
echo "Azure Migration - Deploy Test VM"
echo "======================================"

echo ""
echo "[1] Login to Azure..."
az login

echo ""
echo "[2] Set subscription..."
az account set --subscription $SUBSCRIPTION_ID

echo ""
echo "[3] Creating resource group: $RESOURCE_GROUP"
az group create \
  --name $RESOURCE_GROUP \
  --location $LOCATION

# Step 4: Create Virtual Network
echo ""
echo "[4] Creating Virtual Network..."
az network vnet create \
  --resource-group $RESOURCE_GROUP \
  --name vnet-migration \
  --address-prefix 10.0.0.0/16 \
  --subnet-name subnet-default \
  --subnet-prefix 10.0.1.0/24

echo ""
echo "[5] Creating Network Security Group..."
az network nsg create \
  --resource-group $RESOURCE_GROUP \
  --name nsg-migration

echo ""
echo "[6] Adding NSG rules..."
az network nsg rule create \
  --resource-group $RESOURCE_GROUP \
  --nsg-name nsg-migration \
  --name allow-ssh \
  --priority 1000 \
  --source-address-prefixes '*' \
  --source-port-ranges '*' \
  --direction Inbound \
  --access Allow \
  --protocol Tcp \
  --destination-port-ranges 22

echo ""
echo "[7] Creating Network Interface..."
az network nic create \
  --resource-group $RESOURCE_GROUP \
  --name nic-vm01 \
  --vnet-name vnet-migration \
  --subnet subnet-default \
  --network-security-group nsg-migration

echo ""
echo "[8] Creating Virtual Machine..."
echo "    Name: $VM_NAME"
echo "    Size: $SIZE"
echo "    Image: $IMAGE"

az vm create \
  --resource-group $RESOURCE_GROUP \
  --name $VM_NAME \
  --nics nic-vm01 \
  --image $IMAGE \
  --size $SIZE \
  --admin-username $ADMIN_USERNAME \
  --generate-ssh-keys \
  --public-ip-sku Standard

echo ""
echo "======================================"
echo "✓ VM Deployed Successfully!"
echo "======================================"
echo ""
echo "VM Details:"
echo "  Resource Group: $RESOURCE_GROUP"
echo "  VM Name: $VM_NAME"
echo "  Size: $SIZE"
echo "  Location: $LOCATION"
echo ""
echo "Next Steps:"
echo "1. SSH into VM: ssh azureuser@<PUBLIC_IP>"
echo "2. Get public IP:"
echo "   az vm list-ip-addresses --resource-group $RESOURCE_GROUP"
echo "3. This VM is ready for migration testing"
echo ""
