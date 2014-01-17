### webrockit-phantom-bin

This package fetches phantomjs binaries and builds a phantomjs package, staging the base path to /opt/phantomjs.  The package webrockit-phantom-bin must exist on a webrockit poller phantom (Sensu client).

### To build

   - run ./buildme.sh

This will download the phantomjs binary from the official distribution site, and re-package it into the /opt/phantomjs path.  The final package is located under ./finalpkg/

### License
   webrockit-phantom-bin is released under the MIT license, and bundles other liberally licensed OSS components [License](LICENSE.txt)  
   [Third Party Software](third-party.txt)
