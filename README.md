# full-stack-serverless-app-with-Vue-and-AWS-Amplify

I'm going to follow a tutorial I just found on Medium authored by 
[@gerard.sans](https://medium.com/@gerard.sans)

Here is the url [https://medium.com/@gerard.sans/build-your-first-full-stack-serverless-app-with-vue-and-aws-amplify-9ed7ef9e9926](https://medium.com/@gerard.sans/build-your-first-full-stack-serverless-app-with-vue-and-aws-amplify-9ed7ef9e9926
)


This is basically a Full-stack serverless app using Vue and AWS Amplify, with full authorization flow using the authenticator component.


## Pre requisites:

- Node.js v10.x or later
- npm v5.x or later
- git bash (if using windows) 

## Install dependencies

Run the following command

```
./install-dependencies.sh
```

## Configure amplify

sign up to your AWS Account and configure it, follow instructions on the following link:

[https://docs.amplify.aws/start/getting-started/installation/q/integration/vue#option-2-follow-the-instructions](https://docs.amplify.aws/start/getting-started/installation/q/integration/vue#option-2-follow-the-instructions)

```
amplify configure
```

## Setting up your Amplify project

AWS Amplify allows you to create different environments to define your preferences and settings. For any new project you need to run the command below and answer as follows:

```
amplify init
```

- Enter a name for the project: amplify-app
- Enter a name for the environment: dev
- Choose your default editor: Visual Studio Code
- Please choose the type of app that you’re building javascript
- What javascript framework are you using vue
- Source Directory Path: src
- Distribution Directory Path: dist
- Build Command: npm run-script build
- Start Command: npm run-script serve
- Do you want to use an AWS profile? Yes
- Please choose the profile you want to use default

## Adding authentication 

```
amplify add auth
```

When prompted choose:
- Do you want to use default authentication and security configuration?: Default - configuration
- How do you want users to be able to sign in when using your Cognito User Pool?: Username
- Do you want to configure advanced settings? No

## Pushing changes to the cloud

By running the push command, the cloud resources will be provisioned and created in your AWS account.
```
amplify push
```
To quickly check your newly created Cognito User Pool you can run
```
amplify status
```

# Install and run the vue app

## Project setup
```
yarn install
```

### Compiles and hot-reloads for development
```
yarn serve
```

### Compiles and minifies for production
```
yarn build
```

### Lints and fixes files
```
yarn lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).

To access the AWS Cognito Console at any time, go to the dashboard at https://console.aws.amazon.com/cognito. Also be sure that your region is set correctly.

To view any users that were created, go back to the Cognito Dashboard at https://console.aws.amazon.com/cognito. Also be sure that your region is set correctly.
Alternatively you can also use:
```amplify console auth```

## Accessing User Data

To access the user’s info using the Auth API. This will return a promise.

```javascript
import { Auth } from 'aws-amplify';
Auth.currentAuthenticatedUser().then(console.log)
```

## Publishing your app

To deploy and host your app on AWS, we can use the hosting category.

```amplify add hosting```

- Select the plugin module to execute: Amazon CloudFront and S3
- Select the environment setup: DEV
- hosting bucket name YOURBUCKETNAME
- index doc for the website index.html
- error doc for the website index.html

Now, everything is set up & we can publish it:

```amplify publish```

## Cleaning up Services
To wipe out all resources from your project and your AWS Account, you can do this by running:
```amplify delete```


