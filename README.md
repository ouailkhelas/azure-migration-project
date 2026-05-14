# Azure Migration Project

##  📋 Overview
This project demonstrates discovering and assessing on-premises VMs (VMware) for Azure migration using **Azure Migrate** service.

## ✅ What I Built
- Discovered VMware VMs using Azure Migrate Appliance
- Assessed VMs for Azure readiness
- Generated migration recommendations
- Created Azure VM from assessment

## 📍Technologies Used
- Azure Migrate (Discovery and Assessment)
- Azure Portal
- Azure CLI
- Azure VM (Standard B2s)

## 📍 Project Steps

### 1. Setup Azure Migrate (Portal)
```
1. Create Resource Group: rg-migration
2. Deploy Azure Migrate Project
3. Download Migrate Appliance OVA file
4. Deploy appliance in vCenter
5. Configure appliance with vCenter credentials
```

### 2. Discovery Phase (Portal + CLI)
```
Portal:
- Start discovery of VMware environment
- Appliance collects VM metrics (CPU, RAM, Disk)
- Wait ~24 hours for complete discovery

CLI:
az migrate project list --resource-group rg-migration
```

### 3. Assessment Phase (Portal)
```
1. Create assessment group
2. Add discovered VMs to group
3. Run assessment with settings:
   - Target: Azure VM
   - Storage: Standard HDD
   - Reserved instances: None
4. Review readiness status
```

### 4. Deploy VM in Azure (CLI Script)
```
Run: ./scripts/deploy-vm.sh
This script deploys Azure VM based on assessment
```

### 5. Test Migration (Portal)
```
- Generate report showing:
  ✓ VM readiness
  ✓ Cost estimation
  ✓ Sizing recommendations
  ✓ Monthly cost
```

## 📍Files in Project
- `deploy-vm.sh` - Azure CLI script to deploy test VM
- `discover-vms.sh` - List discovered VMs from Azure Migrate
- `assessment-report.sh` - Pull assessment data

## 📍How to Use

### Step 1: Login to Azure
```bash
az login
az account set --subscription "YOUR_SUBSCRIPTION_ID"
```

### Step 2: Create Resource Group
```bash
az group create --name rg-migration --location eastus
```

### Step 3: Run Discovery Script
```bash
bash scripts/discover-vm.sh
```

### Step 4: Deploy Test VM
```bash
bash scripts/deploy-vm.sh
```

### Step 5: View Assessment
```bash
bash scripts/assessment-report.sh
```

## 📚What I Learned
- How Azure Migrate discovers on-premises infrastructure
- How to assess VMs for cloud readiness
- How to use Azure CLI for automation
- Cost analysis before migration
- Azure VM sizing recommendations
