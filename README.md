# getAssets

A super simple bash script using `rsync` to sync from a remote source to a local destination. My use case is to sync assets (files and images) uploaded on a remote server (say, from a CMS) down to a local copy, where they are ignored in version control.

## Installation

### Bower

* Run `bower install getassets` in your project directory.
* `cd` into `bower_components` and run `init`
* Enter the directory you would like to install the `getassets.sh` script to. *Note: This can be a relative path from `bower_components`, such as `../` to install one diretory up the tree.*

### Manual

* Download and move the `getassets.sh` into your project. I typically put it in the root of the project.

## Configuration

There are (3) parameters that need to be set near the top of the file:

1. `SSHHOST` : The SSH connection to use, i.e. `root@10.0.0.1`
2. `SOURCEDIR` : The full path on the server to sync from.
3. `DESTDIR` : THe full local path to sync to.

Make the script executable, run `chmod +x ./getassets.sh` in your terminal.

## Running the Script

To run the script, in the terminal `cd` into your project directory and run:

`./getassets.sh`

That's it! Now your local project is NSYNC with  your remote!

## Notes

You can run the script from anywhere without setting the above parameters and the script will prompt you for each of the three parameters if you prefer, though this is obvioulsy less convenient.