#!/bin/bash

# Azure Migration Project - Assessment Report
# This script pulls assessment data from Azure Migrate

set -e

# Variables
SUBSCRIPTION_ID="YOUR_SUBSCRIPTION_ID"
RESOURCE_GROUP="rg-migration"

echo "======================================"
echo "Azure Migrate - Assessment Report"
echo "======================================"
echo ""

# Step 1: Login
echo "[1] Login to Azure..."
az login

# Step 2: Set subscription
echo "[2] Set subscription..."
az account set --subscription $SUBSCRIPTION_ID

# Step 3: Show assessment location
echo ""
echo "======================================"
echo "How to Access Assessment Report"
echo "======================================"
echo ""
echo "Method 1: Azure Portal (Recommended for beginners)"
echo "  1. Search for 'Azure Migrate' in Portal"
echo "  2. Click on 'Servers and databases'"
echo "  3. Select your Migration project"
echo "  4. Click 'Assessments' tab"
echo "  5. Open assessment to see:"
echo ""
echo "Assessment Includes:"
echo "├── Azure Readiness"
echo "│   ├── Ready"
echo "│   ├── Conditionally ready"
echo "│   └── Not ready"
echo "├── Sizing Recommendations"
echo "│   ├── Instance type"
echo "│   ├── CPU cores needed"
echo "│   └── RAM needed"
echo "├── Cost Analysis"
echo "│   ├── Compute cost"
echo "│   ├── Storage cost"
echo "│   └── Monthly estimate"
echo "└── Properties"
echo "    ├── OS type"
echo "    ├── Disk count"
echo "    └── Network adapters"
echo ""
echo ""

# Step 4: Show what CLI can do
echo "Method 2: Azure CLI (For automation)"
echo "  List assessments:"
echo "  az resource list -g $RESOURCE_GROUP --query \"[].{Type:type, Name:name}\""
echo ""

# Step 5: Show export options
echo "Method 3: Export Report"
echo "  Portal > Assessment > Download Report (Excel)"
echo "  Includes all VM details and recommendations"
echo ""

echo "======================================"
echo "Key Assessment Metrics"
echo "======================================"
echo ""
echo "✓ Readiness Status     : Is VM ready for Azure?"
echo "✓ VM Size Recommended  : Which Azure VM size fits?"
echo "✓ Monthly Cost         : How much will it cost?"
echo "✓ Storage Type         : Premium or Standard?"
echo "✓ Performance Metrics   : Based on 30 days of data"
echo ""

echo "======================================"
echo "Next Steps After Assessment"
echo "======================================"
echo ""
echo "1. Review readiness status for each VM"
echo "2. Address any 'Not Ready' or 'Conditionally Ready' issues"
echo "3. Estimate total migration cost"
echo "4. Plan migration groups (by dependency)"
echo "5. Create detailed migration plan"
echo "6. Set replication strategy"
echo "7. Test failover to Azure"
echo ""
