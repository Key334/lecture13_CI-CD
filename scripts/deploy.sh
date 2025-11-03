#!/bin/bash
set -e

echo "🚀 Deploying app..."
ansible-playbook -i ansible/inventory/production ansible/playbook.yml
echo "✅ Deployment complete."
