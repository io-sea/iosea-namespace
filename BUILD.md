Building RPMS
=============

One you have recursively git cloned all modules and submodules, run
- ./build_each-srpm.sh 

Once done, src.rpm files have been generated in subdirectories named 'b/' in each repo.
Then you can mock build. Forst edit the baseurl filed in the .cfg file inside mock_cfg, 
it should reflect your current config (this sould be fixed in a later version), then run
- ./all_mock.sh

The resulting rpm files are geenrated in "localrepo/"

