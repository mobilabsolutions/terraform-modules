# Rancher
These are modules we use to handle common tasks on Rancher. 

### Create Rancher API Key
To be able to interact with Rancher resources, credentials are needed. You need to connect to Rancher server and create access key and secret key.

Connect to Rancher Server and Select Keys under API menu
![API keys](https://user-images.githubusercontent.com/29708769/28361299-adbd5f12-6c78-11e7-9b5b-21df5b2c7803.png)

Click Add Account API key button
![Add API key](https://user-images.githubusercontent.com/29708769/28365201-dbdc09d4-6c87-11e7-8490-383db628115f.png)

Add New API Key
![New API key](https://user-images.githubusercontent.com/29708769/28366052-52511502-6c8b-11e7-856d-b67825fdec4e.png)

Save Access Key and Secret Key
![Save the Keys](https://user-images.githubusercontent.com/29708769/28366107-8c1288b6-6c8b-11e7-8f39-9e1c7b226011.png)

Check Created API Key
![Check the Keys](https://user-images.githubusercontent.com/29708769/28366229-16e76ea2-6c8c-11e7-8ae6-220ec9296979.png)

### Configure Provider
A provider block must be present in root folder. Below example shows required variables to configure Rancher provider. 
```hcl
# Configure the Rancher Provider
provider "rancher" {
  api_url    = "..."
  access_key = "..."
  secret_key = "..."
}
```



#### Argument Reference
The following arguments are supported:

Name | Description
----------------- | ---------
api_url  | (Required) Rancher API url. It must be provided, but it can also be sourced from the RANCHER_URL environment variable.
access_key | (Optional) Rancher API access key. It can also be sourced from the RANCHER_ACCESS_KEY environment variable.
secret_key | (Optional) Rancher API access key. It can also be sourced from the RANCHER_SECRET_KEY environment variable.