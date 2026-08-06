# Terraform4 — PR Audit Note

## Registry checks performed

Queried the public Terraform registry to verify the latest published versions
and confirm they match what is pinned/installed in this configuration:

| Component | Source (registry) | Latest version | Used / resolved | Match |
|---|---|---|---|---|
| Provider | `hashicorp/aws` | 6.58.0 | 6.58.0 (`~> 6.0` constraint) | yes |
| Module `my_server` | `terraform-aws-modules/ec2-instance/aws` | 6.4.0 | 6.4.0 (`~> 6.0`) | yes |
| Module `my_vpc` | `terraform-aws-modules/vpc/aws` | 6.6.1 | 6.6.1 (`~> 6.0`) | yes |
| Module `my_sg` | `terraform-aws-modules/security-group/aws` | 6.0.0 | 6.0.0 (`~> 6.0`) | yes |

All pinned versions are current; no provider or module upgrades were required.
Resolved checksums are recorded in `.terraform.lock.hcl`.

## Files changed

- `opencode.json` — configures the `terraform` MCP server (local Docker:
  `hashicorp/terraform-mcp-server`) used to query the registry.
- `terraform4/providers.tf` — AWS provider `~> 6.0`, S3 backend
  `bootcamp-2026-dani21894/terraform4/terraform.tfstate` (`ap-southeast-1`).
- `terraform4/network.tf` — VPC module `tf4-vpc` (10.30.0.0/16, public subnet).
- `terraform4/ec2.tf` — EC2 module `tf4-rackula-server` (t3.micro, Ubuntu
  24.04 AMI, user data, SSM instance profile).
- `terraform4/security.tf` — Security group `tf4-rackula-sg` (ingress 8080,
  egress all).
- `terraform4/iam.tf` — SSM role, `AmazonSSMManagedInstanceCore` policy
  attachment, and instance profile.
- `terraform4/outputs.tf` — exposes `rackula_url`, `instance_id`, and SSM command.
- `terraform4/userdata.sh` — installs Docker, pulls the Rackula compose file,
  and runs `docker compose up -d`.
- `terraform4/index.html` — static student landing page served by Rackula.
- `docker4/compose.yaml` — docker-compose arena (redis profile + avatar on 8080).

## Staged for this PR

- `terraform4/.gitignore` — Terraform ignore rules (state, provider binaries,
  tfvars, crash logs) per terraform1/terraform2 convention.
- `terraform4/.terraform.lock.hcl` — dependency lock file (aws 6.58.0).
