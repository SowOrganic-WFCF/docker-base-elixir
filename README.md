## Development Workflow


### Local Dev

1. Create new branch off of `origin/master` to make your changes
2. Make changes to Dockerfiles and update [`config.mk`](http://config.mk) file with new version
3. Build all images: `make build`
4. Test images using Docker locally. You can use one of the following commands to get a bash shell:
    - base image
      ```sh
      docker run -it uptrend/base-elixir:base-1.2.0 /bin/bash
      ```
    - dev image
      ```sh
      docker run -it uptrend/base-elixir:dev-1.2.0 /bin/bash
      ```
    - ci image
      ```
      docker run -it uptrend/base-elixir:ci-1.2.0 /bin/bash
      ```

When you're ready to release a new version create and merge PR to master.

### Deploy Docker Images
Do this after your PR is merged into master.
1. Pull `origin/master` locally
2. Run `make all`
