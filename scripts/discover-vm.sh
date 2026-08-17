#!/bin/bash

set -e

SUBSCRIPTION_ID="********************"
RESOURCE_GROUP="rg-migration"
PROJECT_NAME="migrate-project"

echo "======================================"
echo "Azure Migrate - List Discovered VMs"
echo "======================================"
echo ""
echo "[1] Login to Azure..."
az login

echo ""
echo "[2] Set subscription..."
az account set --subscription $SUBSCRIPTION_ID

echo ""
echo "[3] Azure Migrate Projects:"
az resource list \
  --resource-group $RESOURCE_GROUP \
  --resource-type "Microsoft.Migrate/assessmentprojects" \
  --query "[].{Name:name, ID:id, Location:location}" \
  --output table

echo ""
echo "[4] To view discovered VMs in Portal:"
echo "    1. Go to Azure Portal"
echo "    2. Search for 'Azure Migrate'"
echo "    3. Click on your migrate project"
echo "    4. Navigate to 'Discovered servers'"
echo ""
echo "    Expected columns:"
echo "    - Server Name (from vCenter)"
echo "    - CPU cores"
echo "    - RAM (MB)"
echo "    - Disk info"
echo "    - OS type"
echo ""

echo "[5] View Assessments:"
echo "    Portal > Azure Migrate > Your Project > Assessments"
echo "    Shows:"
echo "    ✓ Azure Readiness"
echo "    ✓ Monthly cost"
echo "    ✓ VM sizing recommendations"
echo ""

echo "======================================"
echo "Discovery Process"
echo "======================================"
echo ""
echo "Timeline:"
echo "  0-1 hour    : Appliance deployment"
echo "  1-24 hours  : Initial discovery"
echo "  24-48 hours : Performance data collection"
echo "  48+ hours   : Assessment ready"
echo ""
echo "To expedite discovery:"
echo "  1. Ensure appliance has vCenter access"
echo "  2. Add discovery scope (datacenters/hosts)"
echo "  3. Monitor appliance > Enable auto-log"
echo ""
