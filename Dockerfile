# Use an official Node.js runtime as a parent image
FROM node:21

# Install AWS CLI and AWS SAM
RUN apt-get update && \
    apt-get install -y awscli && \
    curl -o /usr/local/bin/sam https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip && \
    chmod +x /usr/local/bin/sam

# Install AWS CDK
RUN npm install -g aws-cdk

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
#COPY package*.json ./

# Install application dependencies
RUN npm install -g npm

# Copy the rest of the application code
#COPY . .

# Expose the port the app runs on
EXPOSE 8080

# Define the command to run the application
CMD ["npm", "start"]
