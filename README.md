# ec2-disaster-recovery
Overview

This project automates disaster recovery for an Amazon EC2 instance by creating a snapshot of its root volume and launching a duplicate instance in a different AWS region. This ensures high availability in case of regional failures.


## 🛠️ Features

- **Automated Snapshot Creation**: Takes snapshots of the root volume.
- **Cross-Region Disaster Recovery**: Copies snapshots and creates an instance in the target region.
- **Infrastructure as Code (IaC)**: Uses Terraform for automation.
- **Data Persistence**: Ensures recovery of EC2 data.
- **Minimal Downtime**: Provides quick recovery in case of failures.

## 🚀 Architecture

1. Identify the source EC2 instance.
2. Create a snapshot of the root volume.
3. Copy the snapshot to the target AWS region.
4. Create a new EBS volume from the copied snapshot.
5. Launch a new EC2 instance using the restored volume.

## 🏗️ Prerequisites

- AWS Account with appropriate IAM permissions.
- Terraform installed (`>= v1.0`)
- AWS CLI configured


## 📂 Project Structure
```bash
.
├── main.tf               # Terraform configuration
├── variables.tf          # Variables for AWS regions & instance details
├── data.tf               # Data sources to fetch existing instance details
├── volume.tf             # EBS snapshot and volume restoration
├── instance.tf           # EC2 instance creation in target region
├── README.md             # Project documentation
```

## 🛠️ Deployment Steps

### 1️⃣ Clone the Repository

```sh
git clone https://github.com/aditya12-g/ec2-disaster-recovery.git
cd ec2-disaster-recovery
```

### 2️⃣ Initialize Terraform

```sh
terraform init
```

### 3️⃣ Plan the Deployment

```sh
terraform plan
```

### 4️⃣ Apply the Changes

```sh
terraform apply -auto-approve
```

### 5️⃣ Destroy (If Needed)

```sh
terraform destroy -auto-approve
```

## 📌 Outputs

After deployment, Terraform will output:
- **New EC2 Instance ID**
- **Public IP of the new instance**

## 🏆 Future Enhancements

- Implement **Lambda Functions** for event-driven automation.
- Integrate **SNS notifications** for snapshot creation and recovery updates.
- Add **Bastion Host** for secure SSH access.

## 📜 License

This project is open-source and available under the MIT License.

## 📬 Connect

For any issues or feature requests, open an issue in the repository!

**Maintainer:** [Aditya](https://github.com/aditya12-g)
