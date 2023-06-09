# csound_max

This is a friendly fork of Iain Duncan's [csound6~](https://github.com/iainctduncan/csound_max) Max External, itself based on [csound_pd](https://github.com/csound/csound_pd) a pure-data csound external by Victor Lazarinni.

The primary aim of the fork is to create a relocatable version of the `csound6~` external which can be included in Max packages and standalones.

Currently this is only available on macOS with a few differences from the main project:

- This fork is only focused on macOS (tested on `x86_64` but no reason why it shoudn't work for `arm64`)

- The project has been restructured as a subproject and `max-sdk-base` is now a git submodule

- The original project README is now in the subproject folder. This README is now in the root of the project.

- A `Makefile` 'frontend' has been added to sequence top-level steps.

- A `source/scripts` folder has been added with the following bash scripts:

	- `build_dependencies.sh` which downloads and builds: 
		
		- `csound` as static library; and

		- `macdylibbundler`, the bundle fixup tool.

	- `fix_bundle.sh`: Move residual dylib dependencies to the bundle and fix the @rpath references


## Usage

Clone the project as follows to also download the `max-sdk-base` submodule:

```bash

git clone --recurse-submodules https://github.com/shakfu/csound_max

```

Build the `csound6~` external for local use:

```bash

make

```

Build the `csound6~` external with the relocatable option (i.e. uses csound static library for packages and standalones):


```bash

make relocatable

```


## Todo

- [ ] add sign and notarize step


