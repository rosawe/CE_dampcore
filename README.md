Code originally written by James Guillochon, with additions from Jamie Law-Smith, Samantha Wu, and Rosa Wallace Everson. README last updated 2/9/2022 by RWE.

This simulation setup allows one to simulate the interaction between an extended, polytropic object or stellar profile and a point mass. The code now utilizes the Sinks module to integrate particle trajectories, which brings the benefit of being able to include an arbitrary number of point-like perturbers. This version has been used to simulate common envelope interactions between massive, extended, post-main sequence stars and compact companions. Any 1D stellar profile can be used to provide the star's structure, as long as the output is formatted correctly. The code has been used successfully with FLASH 4.3, but should not be used with FLASH 4.5.

To install, clone this repository to the Simulation path within the FLASH hierarchy:

	cd /path/to/flash/directory/FLASH4.3/source/Simulation/SimulationMain
	gh repo clone rosawe/CE_dampcore

Then, change back to the main FLASH directory and run the setup script. I recommend the following setup:

	cd /path/to/flash/directory/FLASH4.3
	./setup CE_dampcore -noclobber -maxblocks=2000 -nxb=8 -nyb=8 -nzb=8 -auto -3d -objdir=object_CE_dampcore +newMpole +parallelIO +uhd loadProfile=True

Within this repository are a number of "example" run directories that contain files that need to be included when running this setup under various conditions. The example folder that corresponds to the setup line above is `example_damped_core`, make a full copy of this folder to the location you intend to produce the FLASH outputs. In the output folder, you will also need to include a data file containing your stellar profile.

	cp -R /path/to/flash/directory/FLASH4.3/source/Simulation/SimulationMain/multitidal/example_damped_core /desired/run/location/.

Then, to run FLASH, use `mpirun` (or similar) from that run directory, e.g.

	cd /desired/run/location
	mpirun -np 4 /path/to/flash/directory/FLASH4.3/object_CE_dampcore/flash4

To add additional physics/features, the user needs to modify the setup line above and use a run directory appropriate to that setup:

* For MHD, substitute `+uhd` with `+usm`.

* To load a stellar profile, add `loadProfile=True` to the setup line. This will switch to the Helmholtz equation of state, which is customized by MultiTidal to use an extended Helmholtz table. If you use this flag, you must copy the extended Helmholtz table `helm_extended_table.dat` to your run directory from the object directory. An example directory for use when `loadProfile=True` is included in the repository, `example_profile_setup`.

* Use `+parallelIO` in conjunction with the other flags (if it is supported by your cluster) for faster read/write of HDF5 files.# CE_dampcore
