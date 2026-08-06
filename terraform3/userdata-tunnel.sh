#!/bin/bash
curl -fsSL https://get.docker.com | sh
id ssm-user &>/dev/null || useradd -m ssm-user
usermod -aG docker ssm-user
docker run -d -p 80:80 nginx
docker run -d --network host cloudflare/cloudflared:latest \
  tunnel --no-autoupdate run --token eyJhIjoiMDMxMTk0ZTAxMDVkOWJhNmYwZDM1ZmYyZjhmYTc2NWMiLCJ0IjoiYzJiM2UyYjQtZWUyNy00M2ZmLWE0NTEtNTBlZjljNjNjNzc5IiwicyI6IlpHSXdNV05pTjJVdE4yVmtNaTAwTlRKaUxUazVNemd0TlRabU1UWXdaalk1TTJSayJ9