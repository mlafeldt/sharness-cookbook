name              "sharness"
maintainer        "Mathias Lafeldt"
maintainer_email  "mathias.lafeldt@gmail.com"
license           "Apache 2.0"
description       "Installs Sharness"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.1.0"
recipe            "sharness::default", "Installs Sharness"

supports "ubuntu"
supports "debian"
