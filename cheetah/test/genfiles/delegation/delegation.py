#!/usr/bin/env python
# encoding: utf-8

import os
import os.path
import yaml


def main():

    PATH = "delegation.yaml"

    if os.path.isfile(PATH) and os.access(PATH, os.R_OK):

        config_file = file(PATH, 'r')
        dataModel = yaml.load(config_file)
        config_file.close()

        print dataModel['Rectangle']
        print dataModel['height']
        print dataModel['width']
        print dataModel['area']
        print dataModel['Window']
        print dataModel['rectangle']
        print dataModel['wRect']

        # print datamodel['Shape']
        # print datamodel['Rectangle']
        # print datamodel['width']
        # print datamodel['height']
        # print datamodel['area']
        # print datamodel['Circle']
        # print datamodel['radius']
        # print datamodel['Window']
        # print datamodel['shape']
        # print datamodel['wCirc']
        # print datamodel['wRect']

    else:
        print "Either file is missing or is not readable"

if __name__ == "__main__":
    main()
