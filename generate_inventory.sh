#!/bin/bash

cat <<EOF > inventory
[jenkins_master]
$(terraform output -raw jenkins_master_public_ip)

[jenkins_agent]
$(terraform output -raw jenkins_agent_public_ip)
EOF
