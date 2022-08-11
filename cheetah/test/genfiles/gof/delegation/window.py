#!/usr/bin/env python
# encoding: utf-8

import os
import os.path
import yaml


def main():

    PATH = "window.yaml"

    if os.path.isfile(PATH) and os.access(PATH, os.R_OK):

        config_file = file(PATH, 'r')
        dataModel = yaml.load(config_file)
        config_file.close()

        print "language: %s" % dataModel['language']

        print "delegator name: %s" % dataModel['delegator'][0]['name']

        print "method: %s %s (%s)" % (
            dataModel['delegator'][0]['methods'][0]['return'],
            dataModel['delegator'][0]['methods'][0]['name'],
            dataModel['delegator'][0]['methods'][0]['arguments']
        )

        print "Interface name: %s" % dataModel['interface']

        for delegate in dataModel['delegate']:
            print "delegate class name: %s" % delegate

    else:
        print "Either file is missing or is not readable"

if __name__ == "__main__":
    main()
