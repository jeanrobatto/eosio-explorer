<h1 align="center">EOSIO Labs™: EOSIO Explorer</h1>
<p align="center">
  A full web application to communicate with EOSIO blockchain in a local development environment built using React.
</p>

<p align="center">
  <img alt="EOSIO Labs badge" src="https://img.shields.io/badge/EOSIO-Labs-5cb3ff.svg">
  <img alt="npm" src="https://img.shields.io/npm/v/eosio-explorer.svg">
  <img alt="npm" src="https://img.shields.io/npm/dm/eosio-explorer.svg">
  <img alt="PRs welcome badge" src="https://img.shields.io/badge/PRs-welcome-green.svg">
</p>

## Table of Contents

* [Overview](#overview)
   * [Features](#features)
   * [Main EOSIO Dependencies](#main-eosio-dependencies)
   * [Platform Support](#platform-support)
   * [Required Tools](#required-tools)
   * [Warning for Future Releases](#warning-for-future-releases)
* [Installation](#installation)
   * [For Users](#for-users)
   * [For Contributors](#for-contributors)
   * [OS Platform Specific](#os-platform-specific)
* [Usage](#usage)
    * [Starting the Tool](#starting-the-tool)
    * [Stopping the Tool](#stopping-the-tool)
    * [Initializing with Sample Data](#initializing-with-sample-data)
    * [Modes](#modes)
    * [Using PM2 with the Tool](#using-pm2)
* [Links to Documentation](#links-to-documentation)
* [Contributing](#contributing)
* [License](#license)
* [Important](#important)

## Overview

The EOSIO Labs™: EOSIO Explorer is a full web application that allows developers to bootstrap their smart contract development by providing them the ability to communicate with the EOSIO blockchain in a local development environment. The goal of this application is to provide app developers for the EOSIO blockchain (consisting of smart contract developers and front-end developers) a quick and easy way to create the local development environment required to make and test such applications on the EOSIO blockchain.

The application provides developers the ability to review changes and updates that occur within the blockchain based on their own work, and has the capacity to allow teams of developers to work on the same instance of the blockchain. This is to add an extra layer of ease for application development especially as a way to allow both smart contract developers and front-end developers to work together more closely. For example, front-end developers can test by connecting their applications to the blockchain instantiated by this tool, and perform tests which smart contract developers can review instantly on the tool to determine if behavior is expected or not.

The goal of this application is to enhance the user experience when developing EOSIO-based blockchain applications while at the same time lowering the barrier to entry for newcomers to EOSIO-based blockchain development.

### About EOSIO Labs

EOSIO Labs repositories are experimental.  Developers in the community are encouraged to use EOSIO Labs repositories as the basis for code and concepts to incorporate into their applications. Community members are also welcome to contribute and further develop these repositories. Since these repositories are not supported by Block.one, we may not provide responses to issue reports, pull requests, updates to functionality, or other requests from the community, and we encourage the community to take responsibility for these.

### :warning: Important :warning:

The EOSIO Labs™: EOSIO Explorer is designed specifically to be a tool for local development. Therefore, numerous things must be kept in mind:

1. **Wallet keys used for this tool may be compromised** if your machine is not properly secure. **Keys for live wallets should not be used in EOSIO Explorer as the tool does not include appropriate security measures.**
2. **The tool is not compatible with the EOSIO Mainnet or other public EOSIO-based blockchains**
3. Tools that do not match the versions listed in [required tools](#required-tools) or OSes not listed in the [platform support list](#platform-support) may cause issues

### Features

1. :zap: Smart contract deployment to a connected EOSIO Blockchain
2. :key: Ability to create accounts with `active` and `owner` permissions on a locally created EOSIO Blockchain (:closed_lock_with_key: Private keys stored locally)
3. :octocat: Ability to push actions from a deployed smart contract to a connected EOSIO Blockchain
4. :telescope: Automatically updating lists for blocks produced, transactions performed, actions pushed, etc.
5. :sunglasses: Search for and review accounts and deployed smart contracts on the connected EOSIO Blockchain
6. :electric_plug: Simple way to connect to a different `nodeos` instance 

### Main EOSIO Dependencies

The tool uses the following:

1. [`eosio v1.8.6`](https://github.com/EOSIO/eos/releases/tag/v1.8.6)
2. [`eosio.cdt v1.6.3`](https://github.com/EOSIO/eosio.cdt/releases/tag/v1.6.3)

### Platform Support

* Amazon Linux 2
* CentOS 7
* Ubuntu 16.04
* Ubuntu 18.04
* MacOS 10.14 (Mojave)

### Required Tools

* [Yarn](https://yarnpkg.com/lang/en/) with support at `^1.15.2` (latest stable)
* [Docker](https://www.docker.com/) with support at Docker Engine `18.09.2` (latest stable)
* [Node.JS](https://nodejs.org/en/) with support at `^10.15.3` LTS (latest stable)

:warning: - When using Docker for this tool, we require a minimum resource of **4 CPU, 8 GB memory allocation**.

:warning: - Currently, the project supports `react-scripts v2.x.x` but **not** `react-scripts v3.x.x` in your global dependency (check `yarn global list`).

### Warning for Future Releases 

Applies to releases `> 0.3.1`:

Originally, creating a local instance of `nodeos` using this tool would allow you to use an `eosio` account whose permission credentials are stored locally on the front-end. Specifically, it is hard-coded and could not be changed. However, moving forward, this `eosio` account will now be initialized in the database. **If you connect to a `nodeos` instance using an older version of this tool, you will no longer be able to access the default `eosio` permissions for that node** if you are using future versions of this tool. 

For users or developers using older versions of this tool, **please update** as soon as possible and re-initialize your blockchain as to provide other users with the ability to use these permissions. Furthermore, you can choose to change the public keys of these `eosio` permissions and treat them as if they were normal accounts. **Keep in mind that doing this means you and any other users are now responsible for the new private keys, the tool will not keep track of the private keys for you if you change your connection.** 

## Installation

### For Users

```bash
yarn global add eosio-explorer
```

This will create a globally installed instance of the tool which you can run anywhere.

:warning: - `yarn` will install global packages in a directory that may not be in your executable PATH. This may apply to certain OSes such as Ubuntu. In this case, you need to add the output of `yarn global bin` to your PATH such as in `~/.bash_profile`.

If you wish to install the tool without `global`, then you can do the following instead:

```bash
git clone https://github.com/EOSIO/eosio-explorer.git
yarn build
yarn install
```

After installing, you can do `eosio-explorer -v` or `yarn eosio-explorer -v` to check if the installation worked. If it worked, you should get the current version of the tool.

### For Contributors

See: [Development](./docs/development.md)

### OS Platform Specific

:warning: - In summary, for terminal OSes, headless Chrome (`chrome`) must be available, otherwise you cannot start the GUI.

If you want to start the tool without the GUI to simply create an EOSIO blockchain environment (`nodeos` and PostgresDB setup), please pass the `--server-mode` flag to the `init` or `start` commands. This may be useful for users who run terminal OSes and want to supply their development team with a development environment quickly and painlessly.

#### Ubuntu 18.04 / Ubuntu 16.04

If you want to start the tool with the bundled UI, you will need to make sure your machine or server can open headless Chrome in a sandbox.

#### Amazon Linux 2 (AMI)

Out of the box, Amazon Linux will use an outdated version of Docker which this application currently does not support.

In order to install the tool properly, you will need to manually install the latest stable version of Docker using binaries. You can find the relevant binaries [here](https://docs.docker.com/install/linux/docker-ce/binaries/).

Finally, this requires the instance to be able to run or open headless Chrome in a sandbox.

#### CentOS 7

The tool requires starting a sandbox for headless Chrome, which can get complicated when attempting to run the tool on a variety of instances that don't specifically open a browser.

In CentOS specifically, `SELinux` impedes this process ([original issue](https://github.com/GoogleChrome/puppeteer/issues/2857#issuecomment-446983425)).

You will need to create an exception within SELinux. Setting the following boolean will fix this particular issue:
```bash
setsebool -P unconfined_chrome_sandbox_transition 0
```

Alternatively, though not recommended, you can disable `SELinux` entirely.

## Usage

After installation of the application, depending on how you have installed the tool, can be run in different ways.

```bash
Installed with global                : eosio-explorer <command>
Installed via cloning the repository : yarn eosio-explorer <command>
```

Run the tool with the specified command

```bash
Commands:
  -v                Prints out the current version of the tool

  -h or --help      Prints out the current list of available commands

  init              Initialize the tool by copying initial config, setting up
                    all Docker containers, etc.

                    Available flag(s):
                    -s / --sample-data - Starts the tool with pre-existing sample accounts and
                                         smart contracts
                    --server-mode      - Starts the blockchain environment for the tool without opening
                                         the web application
                    --set-mode         - Set mode can take the value 1, 2 or 3(e.g.: --set-mode=1), 
                                         1- Connect to default Nodeos instance provided by the tool
                                         2- Connect to the endpoint passed using 'nodeos-endpoint=<endpoint>' argument
                                         3- Connect to the endpoint mentioned in config file
                    --nodeos-endpoint  - Starts the tool by connecting to the Nodeos instance endpoint(RPC endpoint) passed, 
                                         this argument is valid only when --set-mode=2

                    Below flag(s) only work in development mode by git cloning the repo:
                    -dev / --develop - Starts the tool in development mode
                    -b / --build - Force building the gui of the tool

  start             Start the tool, assumes the dependencies and Docker images are already prepared (using init command)

                    Available flag(s):
                    --server-mode      - Starts the blockchain environment for the tool without
                                         opening the web application
                    --clear-browser-storage - Starts the tool with clearing browser local storage
                    -del / --delete    - Removes existing Docker containers and clear the browser local storage

                    Below flag(s) only work in development mode by git cloning the repo:
                    -dev / --develop   - Starts the tool in development mode
                    -b / --build       - Force building the gui of the tool
                    --no-timestamp     - Builds gui without adding env LASTTIMESTAMP.
                                         Should only used by developer right before making a release

  stop_dockers      Stops any currently running Docker containers gracefully

  remove_dockers    Remove any currently present Docker containers
```

You can also add the `-h` flag to any of the commands listed above to view the available flags for each command within the terminal.

### Starting the Tool

There are ways to start the tool depending on what you need or want to accomplish:

```bash
eosio-explorer init
```

```bash
eosio-explorer start 
```

```bash
eosio-explorer 
```

Running `eosio-explorer` without any command is equivalent to running `eosio-explorer start`

This section will detail the specific differences between the two commands and help you decide when you should use one or the other.

#### `init`

The `init` command will perform the following operations when starting the tool:

1. Create a config file which stores the Nodeos instance endpoint based on user selction.
2. Setting up and copying the initial configurations for the tool
3. Checking and building Docker images if necessary
4. Check if package dependencies need to be installed. **This step won't execute if you have installed this tool with `yarn global`.**
5. Clear the local storage, if it needs to be cleared. Otherwise, just provide the initial state
6. Forcefully remove any existing Docker containers and volumes before starting new ones
7. Operations indicated by command flags/options

Therefore, you would want to use this command under these general circumstances:

1. You just installed the tool
2. You want switch to different blockchain using the instance endpoint
3. You want to re-initialize the tool after installing an update (rebuilding Docker images, etc.)
4. You want to completely wipe your blockchain data, start from scratch.
5. You want to re-initialize the tool after changing some configuration data

#### `start`

The `start` command will just do the following:

1. Try to resume stopped Docker containers. **If no Docker containers exist, new ones will be started**. 
3. Operations indicated by command flags/options

Therefore, you would want to use this command under these general circumstances:

1. You have already run `init` command to initialize the tool
2. You want to start the tool normally without changing the endpoint (connects to the endpoint provided in previous run)
2. You have stopped Docker containers and want to resume a locally created blockchain

Ideally, for each update installed, you want to run `init` command once, and then just use `start` thereafter. 

Using the `start` command assumes you have already built and installed all necessary dependencies. 

### Stopping the Tool

:warning: - Proper way to pause/stop the docker containers is to use the below command, if you don't stop the docker containers properly then you may lose the data on the blockchain. Also, use this command and stop docker containers before shutting down the system to save data.

```bash
eosio-explorer stop_dockers
```

Then use `eosio-explorer start` to resume/restart the docker containers.

### Initializing with Sample Data 

If you want to initialize a new blockchain with sample accounts and data, you can do the following:

```bash
eosio-explorer init --sample-data 
```

### Note while connecting to external nodeos endpoint
If you choose to connect to the nodeos instance other than default instance provided by the tool:
* Make sure the State History Plugin(SHiP) is enabled 
* SHiP plugin port should be defaulted to 8080
* The hostname of nodeos endpoint and SHiP plugin websocket endpoint should be same. The tool extracts the hostname from the nodeos endpoint passed and       establish connection with the same host name with 8080 port.     
  eg: If the nodeos endpoint is `http://localhost:8888` the SHiP plugin websocket endpoint is constructed as `localhost:8080`
* Also, if you try to connect to the nodeos instance running locally in your machine other than the default instance provided by the tool, please use         your machine IP instead of localhost in the endpoint
* Changing the connection **will clear your locally stored private keys** so please back them up in advance if you need to.

### Modes

**Development mode**

Sacrifices some performance but enables hot code reloading, allowing you to work on contributing to the project without rebuilding. This will not run as a background process. This mode is ONLY to be used for developing the core functionality of EOSIO Explorer not for development of dApps. Unless you don't plan to modify or add new functionality to the tool, the production mode is supposed to be used.

**Production mode**

serves a pre-rendered, pre-loaded version of the tool for speed and performance, and is for users of the tool.

### Using `pm2`

The tool, in production mode, will run persistently in the background using `pm2`, meaning that you can choose to keep it running indefinitely. If you want to close the tool, you will need to kill the process which is listening on the port you specified in the configuration. By default, the production mode port is `5111`. You can use utilities like `netstat` and `lsof` to check this.

If you want, you can globally install `pm2` (`yarn global add pm2` or `npm install -g pm2`) to make managing this process easier, so you can run commands like `pm2 status` to check.

The quickest way to eliminate all processes on pm2 is to use `pm2 kill`.

Otherwise, you can check the list of processes with `pm2 list` (for example, you are running other Node processes using `pm2`), then use `pm2 delete <id>` to delete the specific processes you want. **You would need to use the process ID of `pm2`, not the process ID of your OS/machine**.

The processes will be called `eosio compiler` for the compiler service and `eosio explorer` for the main tool, when being served.

## Links to Documentation

* [Main Documentation](./docs)
* [Development](./docs/development.md)

## Analytics

In order to help us understand developer usage better, the application will connect to Google Analytics to provide us basic info on country, browser, OS and ISP.”

## Contributing

Interested in contributing? That's awesome! Please view the following links for more information on contributing to the project.

[Contribution Guidelines](./CONTRIBUTING.md)

## License

[MIT](./LICENSE)

## Important

See LICENSE for copyright and license terms.  Block.one makes its contribution on a voluntary basis as a member of the EOSIO community and is not responsible for ensuring the overall performance of the software or any related applications.  We make no representation, warranty, guarantee or undertaking in respect of the software or any related documentation, whether expressed or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall we be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or documentation or the use or other dealings in the software or documentation. Any test results or performance figures are indicative and will not reflect performance under all conditions.  Any reference to any third party or third-party product, service or other resource is not an endorsement or recommendation by Block.one.  We are not responsible, and disclaim any and all responsibility and liability, for your use of or reliance on any of these resources. Third-party resources may be updated, changed or terminated at any time, so the information here may be out of date or inaccurate.  Any person using or offering this software in connection with providing software, goods or services to third parties shall advise such third parties of these license terms, disclaimers and exclusions of liability.  Block.one, EOSIO, EOSIO Labs, EOS, the heptahedron and associated logos are trademarks of Block.one.

Wallets and related components are complex software that require the highest levels of security.  If incorrectly built or used, they may compromise users’ private keys and digital assets. Wallet applications and related components should undergo thorough security evaluations before being used.  Only experienced developers should work with this software.
