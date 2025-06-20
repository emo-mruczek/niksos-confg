{pkgs, ...}: {
services.batsignal = {
        enable = true;
        extraArgs = [
                "-b"
                "-w" 
                "20" 
                "-f"
                "100"
                "-p"
            ]; 
    };
}
