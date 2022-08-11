#!/usr/bin/env python
# encoding: utf-8

import yaml
from optparse import OptionParser


def main():
    parser = OptionParser(usage="usage: %prog [options]",
                          version="%prog 1.0")

    parser.add_option("-w", "--write",
                      action="store_true",
                      dest="write_files",
                      default=False,
                      help="Enable create template files")

    parser.add_option("-f", "--file",
                      action="store",
                      dest="yaml_file",
                      default="file.yaml",
                      help="YAML file to parser",)

    (options, args) = parser.parse_args()

    print args
    print options

    import os
    import os.path

    PATH = options.yaml_file

    if os.path.isfile(PATH) and os.access(PATH, os.R_OK):

        print "File exists and is readable"

        config_file = file(options.yaml_file, 'r')
        dataModel = yaml.load(config_file)
        config_file.close()

        print dataModel

    else:
        print "Either file is missing or is not readable"


if __name__ == "__main__":
    main()
