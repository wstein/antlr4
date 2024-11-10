#!/usr/bin/env sh

main() {
    InstallStandardPackages
    InstallCrystal
}

# Install Packages from Debin repository
InstallStandardPackages() {
    sudo apt-get update
    sudo apt-get install -y valac meson
}

# Install Crystal for aarch64 architecture
InstallCrystal() {
    curl -fsSL https://packagecloud.io/84codes/crystal/gpgkey | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/84codes_crystal.gpg > /dev/null
    echo "deb https://packagecloud.io/84codes/crystal/any any main" | sudo tee /etc/apt/sources.list.d/84codes_crystal.list
    sudo apt-get update
    sudo apt-get install -y crystal
}

main "$@"
