# AEMvA FVP on MacOS

Run FVP inside Docker container on MacOS 15+

## Pre-Requisites

Install XQuartz for X11 support:  
  
```sh
    brew install --cask --no-quarantine xquartz
    defaults write org.xquartz.X11 nolisten_tcp -bool false
    defaults write org.xquartz.X11 no_auth -bool false
    
    mkdir -p ~/.xinitrc.d
    
    cat << 'EOF' > ~/.xinitrc.d/xhost-config.sh
    #!/bin/sh
    
    xhost +localhost
    xhost +\$(hostname)
    EOF
    
    chmod +x ~/.xinitrc.d/xhost-config.sh
    
    open -a XQuartz
```

## Build

Execute `build.sh` to create a docker fvp image

## Run

Execute `run.sh`  
FVP executable located at `/opt/fvp/models/Linux64_armv8l_GCC-9.3/FVP_Base_RevC-2xAEMvA`


## Acknowledgements

Based on recipes from:  

* https://gist.github.com/devnoname120/ce02ef43da968e15340427c2f1c286a7
* https://github.com/Arm-Examples/FVPs-on-Mac/blob/main/README.md
