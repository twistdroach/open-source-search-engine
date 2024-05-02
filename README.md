# open-source-search-engine
An open source web search engine and spider/crawler. This was once the codebase for a search engine called Gigablast, but the site is no longer operational.  This is a fork of the original codebase located at https://github.com/gigablast/open-source-search-engine

# Quick Start
To experiment, you can quickly launch via docker by running:
```
docker run -p 8000:8000 -it --rm moldybits/open-source-search-engine
```

If you wish to preserve data between runs, you can:
```
docker run -p 8000:8000 -it --rm -v $(pwd)/data:/var/gigablast/data0 moldybits/open-source-search-engine
```

# Building
This does not build on ARM and does not work correctly on modern versions of MacOS, though it looks like there once was support at one point in time.

## Debian or Ubuntu
```
sudo apt-get install make g++ libssl-dev libz-dev
```

## RedHat or AlmaLinux
I haven't tried this lately...
```
sudo yum install gcc-c++ openssl-devel
```

# Issues & Pull Requests
Should be filed at https://github.com/twistdroach/open-source-search-engine

# Documentation
There are various docs located in the html directory.  The FAQ & developer.html are particularly interesting.

