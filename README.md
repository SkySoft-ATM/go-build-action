# go-build-action
Github action to build go projects

# Usage
<!-- start usage -->
```yaml
- uses: SkySoft-ATM/go-build-action@v1
  with:
    # Github user
    github_user:  ${{ secrets.MY_GITHUB_USER }}
    
    # Github token
    github_token:  ${{ secrets.MY_GITHUB_TOKEN }}

    # GKE Project
    # Default:  ccs-skyserver
    project: myProject
    
    # The dockerfile used to build the docker image
    # By default a generic docker file will be used. If you want more flexibility for your project, you can point to a custom dockerfile
    dockerfile: ''

    # Options for the gosec command line
    # Default: ''
    gosec_opts: '-exclude-dir=myExcludedDir'

```
<!-- end usage -->