# Use Debian slim as the base image
FROM  debian:trixie-slim

# Update the package list and install required tools
RUN apt-get update && apt-get install -y curl gpg

# Download and install the GitHub CLI
RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && apt-get update \
    && apt-get install -y gh

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the entrypoint
ENTRYPOINT ["gh"]
 
