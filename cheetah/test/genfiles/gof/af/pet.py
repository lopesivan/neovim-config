#!/usr/bin/env python
# encoding: utf-8

import os
import os.path
import yaml


def main():

    PATH = "pet.yaml"

    if os.path.isfile(PATH) and os.access(PATH, os.R_OK):

        config_file = file(PATH, 'r')
        dataModel = yaml.load(config_file)
        config_file.close()

        print "language: %s" % dataModel['language']

        for types in dataModel['types']:
            print "type name: %s" % types

        for factory in dataModel['factory']:
            for abstract in factory['abstract']:
                print "Abstract Factory: %sFactory" % abstract['name'].title()
                print "Abstract Factory static method: %s()" % \
                    abstract['method']

                for products in dataModel['products']:
                    for abstract in products['abstract']:
                        print "Abstract Product: %s" % abstract['name'].title()

                        for method in abstract['methods']:
                            print "method: %s" % method

    else:
        print "Either file is missing or is not readable"

if __name__ == "__main__":
    main()
