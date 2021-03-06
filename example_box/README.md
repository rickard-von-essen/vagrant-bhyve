# Vagrant Bhyve Example Box

Vagrant providers each require a custom provider-specific box format.
This folder shows the example contents of a box for the `bhyve` provider.
To turn this into a box create a vagrant image according documentation (don't
    forget to install rsync command) and create box with following command:

```
$ tar cvzf test.box ./metadata.json ./Vagrantfile ./disk.img
```

This box works by using Vagrant's built-in Vagrantfile merging to setup
defaults for Bhyve. These defaults can easily be overwritten by higher-level
Vagrantfiles (such as project root Vagrantfiles).

## Box Metadata

Bhyve box should define at least two data fields in `metadata.json` file.

* provider - Provider name is bhyve.
* firmaware - Firmware should be bios or uefi.
* loader - Loader should be grub-bhyve or bhyveload when firmware is bios. This key should keep blank when firmware is uefi.

## Converting Boxes

Instead of creating a box from scratch, you can use 
[vagrant-mutate](https://github.com/sciurus/vagrant-mutate) 
to take boxes created for other Vagrant providers and use them 
with vagrant-bhyve
